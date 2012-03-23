require 'test_helper'

module TaskScheduler
  class ScheduledTaskTest < ActiveSupport::TestCase
    def setup
      @knowns = {
        :rake_method => 'log:clear',
        :interval_seconds => 3600,
        :next_run => Time.now
      }
    end

    test "create" do
      created = ScheduledTask.create(@knowns)
      scheduled_task = ScheduledTask.find(:first)
      assert_kind_of(ScheduledTask, scheduled_task )
      assert_equal(created.id, scheduled_task.id )
      assert_equal(@knowns[:rake_method], scheduled_task.rake_method )
    end

  end
end
