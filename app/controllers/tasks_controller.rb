class TasksController < ApplicationController
  def new
  end
  
  def create
    workhour = 60
    @girl = Girl.find(params[:girl_id])
    @task = @girl.tasks.build( starttime: Time.now, endtime: Time.now + (60 * workhour))
    @girl.start_work
    
    if @task.save
      redirect_to girl_url(@girl)
    else
    end
  end
  
  def edit
  end
  
  def update
    workhour = 60
     @girl = Girl.find(params[:girl_id])
    @task = @girl.tasks.last
    @task.endtime += 60 * workhour
    @girl.start_work
    if @task.save
      redirect_to girl_url(@girl)
    else
    end
  end
  
  def destroy
    @girl = Girl.find(params[:girl_id])
    @task = @girl.tasks.last
    @task.endtime = Time.now
    @task.save
    @girl.complete_work
    
    redirect_to girl_url(@girl)
    
  end
  
end
