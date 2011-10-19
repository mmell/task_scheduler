class TaskSchedulerController < ApplicationController
  
  layout 'admin.html.erb'
  
  before_filter :task_scheduler_access_control # must be implemented by the hosting app

  verify :method => :post, :only => [ :destroy, :create, :update ],
           :redirect_to => { :action => :list }

  def index
    list
    render( :action => 'list')
  end

  def list
    @scheduled_tasks = ScheduledTask.paginate( :all, 
      :per_page => 20,
      :page => params[:page]
  	)
  end

  def show
    @scheduled_task = ScheduledTask.find(params[:id], :include => :scheduled_task_runs)
  end

  def new
    @scheduled_task = ScheduledTask.new
  end

  def create
    @scheduled_task = ScheduledTask.new(params[:scheduled_task])
    if @scheduled_task.save
      flash[:notice] = 'ScheduledTask was successfully created.'
      redirect_to( :action => 'list')
    else
      render( :action => 'new')
    end
  end

  def edit
    @scheduled_task = ScheduledTask.find(params[:id])
  end

  def update
    @scheduled_task = ScheduledTask.find(params[:id])
    if @scheduled_task.update_attributes(params[:scheduled_task])
      flash[:notice] = 'ScheduledTask was successfully updated.'
      redirect_to :action => 'show', :id => @scheduled_task
    else
      render( :action => 'list')
    end
  end

  def destroy
    ScheduledTask.find(params[:id]).destroy
    redirect_to( :action => 'list')
  end

end
