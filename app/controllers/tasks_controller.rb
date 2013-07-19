class TasksController < ApplicationController
  before_filter :authenticate_user!
  def new
  end
  
  def index
    this_company = "technician_id in (#{@current_company.technician_ids.join(',')})"
    case params[:by_star]
    when "today"
      tasks = Task.today.order("created_at DESC").joins(:technician).where(this_company)
    when "yesterday"
      tasks = Task.yesterday.order("created_at DESC").joins(:technician).where(this_company)
    when "thisweek"
      tasks = Task.by_week.order("created_at DESC").joins(:technician).where(this_company)
    when "thismonth"
      tasks = Task.by_month.order("created_at DESC").joins(:technician).where(this_company)
    when "beforeweek"
      week = Time.now.strftime("%W").to_i - 1
      year = (week != 0 ? Time.now.strftime("%Y").to_i : Time.now.strftime("%Y").to_i - 1)
      tasks = Task.by_week(week, :year => year).order("created_at DESC").joins(:technician).where(this_company)
    when "thisyear"
      tasks = Task.by_year.order("created_at DESC").joins(:technician).where(this_company)
    else
      tasks = Task.order("created_at DESC").joins(:technician).where(this_company)
    end
    @total_prices = tasks.sum(:price)
    @tasks = tasks.paginate(page: params[:page], per_page: 50)
  end
  
  def create
    worktime      = Dict.where(["category = ?", "workhours"]).first.value.to_i
    
    #60s * worktime min
    @task = Task.new(params[:task])
    @task.price =0 if @task.price.blank?
    @task.starttime = Time.now
    @task.endtime = Time.now + (60 * worktime)
    @technician = Technician.find(@task.technician_id)
    
    if @task.save
      @technician.start_work
      redirect_to technician_url(@technician)
    else
    end
  end
  
  def edit
  end
  
  def update
    worktime      = Dict.where(["category = ?", "workhours"]).first.value.to_i
    @technician         = Technician.find(params[:technician_id])
    @task         = @technician.tasks.last
    #60s * worktime min
    @task.endtime += 60 * worktime
    @technician.start_work
    if @task.save
      redirect_to technician_url(@technician)
    else
    end
  end
  
  def destroy
    @technician         = Technician.find(params[:technician_id])
    @task         = @technician.tasks.last
    @task.endtime = Time.now
    @task.save
    @technician.complete_work
    
    redirect_to technician_url(@technician)
    
  end
  
end
