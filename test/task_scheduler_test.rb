require 'test_helper'

class TaskSchedulerTest < ActiveSupport::TestCase
  def setup
    @knowns = {
      :rake_method => 'task_scheduler:run',
      :interval_seconds => 3600,
      :now => Time.now
    }
  end

  test "truth" do
    assert_kind_of Module, TaskScheduler
  end

  def test_this_plugin
    ScheduledTask.create(:rake_method => @knowns[:rake_method], :interval_seconds => @knowns[:interval_seconds], :next_run => @knowns[:now] )
    scheduled_task = ScheduledTask.find(:first)
    assert_kind_of(ScheduledTask, scheduled_task )
    assert_equal(@knowns[:rake_method], scheduled_task.rake_method )
  end

  def test_bundler
    raise RuntimeError, 'need to test that bundle exec Rake::Task[e.rake_method].invoke works properly in rake task_scheduler:run'
  end


end
