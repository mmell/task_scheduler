module TaskScheduler
  module ScheduledTasksHelper
    def select_state?(state)
      @scheduled_task.state == state ? ' selected="selected"' : ''
    end

    def format_datetime(dt)
      return '' unless dt
      dt.strftime("%Y/%m/%d %H:%M:%S")
    end

  end
end
