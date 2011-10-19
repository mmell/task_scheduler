class <%= class_name %> < ActiveRecord::Migration
  def self.up
    rename_column :tasks, :task, :rake_method
    rename_table :tasks, :scheduled_tasks
    rename_column :task_runs, :task_id, :scheduled_task_id
    rename_table :task_runs, :scheduled_task_runs
  end

  def self.down
    rename_table :scheduled_tasks, :tasks
    rename_column :tasks, :rake_method, :task
    rename_table :scheduled_task_runs, :task_runs
    rename_column :task_runs, :scheduled_task_id, :task_id
  end
end
