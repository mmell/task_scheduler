require 'test_helper'

class ScheduledTasksTest < ActiveSupport::TestCase

  def setup
    @knowns = {
      :rake_method => 'task_scheduler:run',
      :interval_seconds => 3600,
      :now => Time.now
    }
  end

  def test_this_plugin
    ScheduledTask.create(:rake_method => @knowns[:rake_method], :interval_seconds => @knowns[:interval_seconds], :next_run => @knowns[:now] )
    scheduled_task = ScheduledTask.find(:first)
    assert_kind_of(ScheduledTask, scheduled_task )
    assert_equal(@knowns[:rake_method], scheduled_task.rake_method )
  end
end

