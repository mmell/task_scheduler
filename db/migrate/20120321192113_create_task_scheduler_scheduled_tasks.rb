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

      t.timestamps
    end

    create_table :task_scheduler_scheduled_task_runs do |t|
      t.integer  "scheduled_task_id"
      t.text     "report"
      t.timestamps
    end
  end
end
