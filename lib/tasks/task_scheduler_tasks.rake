# thanks http://stefankst.net/2007/06/05/capture-standard-output-in-ruby/
def with_stdout_captured
   old_stdout = $stdout
   out = StringIO.new
   $stdout = out
   begin
      yield
   ensure
      $stdout = old_stdout
   end
   out.string
end

namespace :task_scheduler do

  desc "reset stuck scheduled_tasks"
  task( :clear_stale, [] => [:environment]) { |t, args|
    stale = ScheduledTask.find(:all,
      :conditions => "state=#{ScheduledTask::States[:run]} and (started < DATE_SUB(NOW(), INTERVAL 6 HOUR) or started is null)"
    )
    stale.each { |e|
      e.update_attributes(:state => 0, :started => nil)
    }
    puts "found #{stale.size} stale scheduled_tasks"
  }

  desc "cleanup_task_runs"
  task( :cleanup_task_runs, [] => [:environment]) { |t, args|
    DAYS = 14
    result = ScheduledTaskRun.destroy_all( "created_at <= DATE_SUB( NOW(), INTERVAL #{DAYS} DAY)")
    puts "destroyed #{result.size} scheduled_task_runs."
  }

  desc "task_scheduler optimize tables"
  task( :optimize_tables, [] => [:environment]) { |t, args|
    tables = %W{ scheduled_task_runs scheduled_tasks }
    tables.each { |e|
      ActiveRecord::Migration.execute( "optimize table #{e};")
    }
    puts("complete optimize tables [#{tables.join(', ')}]")
  }

  desc "run scheduled_tasks"
  task( :run, [] => [:environment]) { |t, args|
    ScheduledTask.find(:all,
      :conditions => "next_run <= NOW() and state = #{ScheduledTask::States[:sleep]}",
      :order => :next_run
    ).each { |e|
      report = with_stdout_captured do
        begin
          puts "RUN TASK #{e.rake_method}( #{e.get_args.join(', ')} )"
          e.running
          Rake::Task[e.rake_method].invoke
        rescue StandardError => err
          puts <<-EOS
#{File.expand_path(__FILE__)}
AT: #{Time.now}

RAN: #{e.rake_method}( #{e.get_args.join(', ')} )

CRASHED:
#{err}
#{$@.join("\n")}

REPORT
#{report.to_s}
EOS
        end
        puts '================================'
      end
      puts( report)
      e.ran(report)

    }
  }


end
