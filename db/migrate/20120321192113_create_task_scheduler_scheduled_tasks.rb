class CreateTaskSchedulerScheduledTasks < ActiveRecord::Migration
  def change
    create_table :task_scheduler_scheduled_tasks do |t|
      t.string :rake_method
      t.string :args
      t.string :args_sep
      t.string :notify_email
      t.integer :interval_seconds
      t.datetime :next_run
      t.datetime :last_run
      t.integer :state
      t.datetime :started
      t.datetime :created_on
      t.datetime :updated_on

      t.timestamps
    end
  end
end
