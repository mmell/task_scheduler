module TaskScheduler
  class ScheduledTaskRun < ActiveRecord::Base
    belongs_to :scheduled_task
  end
end
