module TaskScheduler
  module ScheduledTasksHelper
    def select_state?(state)
      @scheduled_task.state == state ? ' selected="selected"' : ''
    end
  end
end
