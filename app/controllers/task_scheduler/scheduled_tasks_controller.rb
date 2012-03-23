module TaskScheduler
  class ScheduledTasksController < ApplicationController

    layout 'admin'

    before_filter :task_scheduler_access_control # must be implemented by the hosting app

    # GET /scheduled_tasks
    # GET /scheduled_tasks.json
    def index
      @scheduled_tasks = ScheduledTask.paginate(
        :per_page => 20,
        :page => params[:page]
      )

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @scheduled_tasks }
      end
    end

    # GET /scheduled_tasks/1
    # GET /scheduled_tasks/1.json
    def show
      @scheduled_task = ScheduledTask.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @scheduled_task }
      end
    end

    # GET /scheduled_tasks/new
    # GET /scheduled_tasks/new.json
    def new
      @scheduled_task = ScheduledTask.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @scheduled_task }
      end
    end

    # GET /scheduled_tasks/1/edit
    def edit
      @scheduled_task = ScheduledTask.find(params[:id])
    end

    # POST /scheduled_tasks
    # POST /scheduled_tasks.json
    def create
      @scheduled_task = ScheduledTask.new(params[:scheduled_task])
      p = params[:scheduled_task]
      d = DateTime.new(p["next_run(1i)"].to_i, p["next_run(2i)"].to_i, p["next_run(3i)"].to_i, p["next_run(4i)"].to_i, p["next_run(5i)"].to_i)
      @scheduled_task.next_run = d

      respond_to do |format|
        if @scheduled_task.save
          format.html { redirect_to @scheduled_task, notice: 'Scheduled task was successfully created.' }
          format.json { render json: @scheduled_task, status: :created, location: @scheduled_task }
        else
          format.html { render action: "new" }
          format.json { render json: @scheduled_task.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /scheduled_tasks/1
    # PUT /scheduled_tasks/1.json
    def update
      @scheduled_task = ScheduledTask.find(params[:id])

      respond_to do |format|
        if @scheduled_task.update_attributes(params[:scheduled_task])
          format.html { redirect_to @scheduled_task, notice: 'Scheduled task was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @scheduled_task.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /scheduled_tasks/1
    # DELETE /scheduled_tasks/1.json
    def destroy
      @scheduled_task = ScheduledTask.find(params[:id])
      @scheduled_task.destroy

      respond_to do |format|
        format.html { redirect_to scheduled_tasks_url, notice: 'Scheduled task was successfully destroyed.'  }
        format.json { head :no_content }
      end
    end
  end
end
