class TasksController < ApplicationController
  def new
  end
  
  def index
    @tasks = Task.order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end
  
  def create
    worktime      = Dict.where(["category = ?", "workhours"]).first.value.to_i
    
    #60s * worktime min
    @task = Task.new(params[:task])
    @task.price =0 if @task.price.blank?
    @task.starttime = Time.now
    @task.endtime = Time.now + (60 * worktime)
    @girl = Girl.find(@task.girl_id)
    
    if @task.save
      @girl.start_work
      redirect_to girl_url(@girl)
    else
    end
  end
  
  def edit
  end
  
  def update
    worktime      = Dict.where(["category = ?", "workhours"]).first.value.to_i
    @girl         = Girl.find(params[:girl_id])
    @task         = @girl.tasks.last
    #60s * worktime min
    @task.endtime += 60 * worktime
    @girl.start_work
    if @task.save
      redirect_to girl_url(@girl)
    else
    end
  end
  
  def destroy
    @girl         = Girl.find(params[:girl_id])
    @task         = @girl.tasks.last
    @task.endtime = Time.now
    @task.save
    @girl.complete_work
    
    redirect_to girl_url(@girl)
    
  end
  
end
