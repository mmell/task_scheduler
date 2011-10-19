class <%= class_name %> < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t| 
      t.column :task, :string, :unique => true
      
      t.column :state, :integer, :default => Task::States[:sleep]
      t.column :started, :datetime

      t.column :args, :string
      t.column :args_sep, :string, :default => ':'
      t.column :notify_email, :string
      t.column :interval_seconds, :integer, :default => 24*60*60 # one day
      t.column :next_run, :datetime
      t.column :last_run, :datetime
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
      t.column :state, :integer, :default => 0
      t.column :started, :datetime
    end

    create_table :task_runs do |t| 
      t.column :task_id, :integer
      t.column :report, :text
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end

# uncomment and edit to add initial tasks

#    Task.create({:task => 'clean_sessions', # must move RAILS_ROOT/vendor/plugins/at_linksafe_task_scheduler/lib/clean_sessions.rb.sample to RAISL_ROOT/lib/tasks/clean_sessions.rb
#      :args => '120', # 120 minutes
#      :args_sep => '*',
#      :notify_email => 'example@example.com',
#      :interval_seconds => 15*60,
#      :next_run => Time.now
#    })

#  Task.create({:task => 'cleanup_task_runs', # must move RAILS_ROOT/vendor/plugins/at_linksafe_task_scheduler/lib/cleanup_task_runs.rb to RAISL_ROOT/lib/tasks/cleanup_task_runs.rb
#    :args => '30', # 30 days
#    :args_sep => '*',
#    :notify_email => 'example@example.com',
#    :interval_seconds => 60*60*24,
#    :next_run => Time.now
#  })    
    
  end

  def self.down
    drop_table :tasks
    drop_table :task_runs
  end
end
