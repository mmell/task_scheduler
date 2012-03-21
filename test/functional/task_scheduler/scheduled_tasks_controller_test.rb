require 'test_helper'

module TaskScheduler
  class ScheduledTasksControllerTest < ActionController::TestCase
    setup do
      @scheduled_task = scheduled_tasks(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:scheduled_tasks)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create scheduled_task" do
      assert_difference('ScheduledTask.count') do
        post :create, scheduled_task: @scheduled_task.attributes
      end
  
      assert_redirected_to scheduled_task_path(assigns(:scheduled_task))
    end
  
    test "should show scheduled_task" do
      get :show, id: @scheduled_task
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @scheduled_task
      assert_response :success
    end
  
    test "should update scheduled_task" do
      put :update, id: @scheduled_task, scheduled_task: @scheduled_task.attributes
      assert_redirected_to scheduled_task_path(assigns(:scheduled_task))
    end
  
    test "should destroy scheduled_task" do
      assert_difference('ScheduledTask.count', -1) do
        delete :destroy, id: @scheduled_task
      end
  
      assert_redirected_to scheduled_tasks_path
    end
  end
end
