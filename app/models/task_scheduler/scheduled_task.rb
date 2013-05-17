module TaskScheduler
  class ScheduledTask < ActiveRecord::Base
    has_many :scheduled_task_runs, :dependent => :destroy, :order => 'created_at desc'

    States = {
      :sleep => 0,
      :run => 1,
      :disabled => 2,
    }

    scope :ready_to_run, -> { where("next_run <= NOW() and state = #{TaskScheduler::ScheduledTask::States[:sleep]}").order(:next_run) }

    def ran( report )
      if self.next_run < self.started
        self.next_run = self.started
      end
      self.update_attributes( {
        :last_run => self.started,
        :started => nil,
        :next_run => self.next_run + self.interval_seconds,
        :state => States[:sleep]
        } )
      self.scheduled_task_runs.create({:report => report.inspect})
    end

    def running
      self.update_attributes( :state => States[:run], :started => Time.now )
    end

    def args_array
      self.args ? self.args.split(self.args_sep) : []
    end

  end
end
