class TasksController < ApplicationController
  def new
  end
  
  def create
    worktime      = Dict.where(["category = ?", "workhours"]).first.value.to_i
    @girl         = Girl.find(params[:girl_id])
    #60s * worktime min
    @task         = @girl.tasks.build( starttime: Time.now, endtime: Time.now + (60 * worktime))
    @girl.start_work
    
    if @task.save
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
