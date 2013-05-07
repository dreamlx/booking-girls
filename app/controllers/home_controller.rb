class HomeController < ApplicationController
  before_filter :check_girls_state
  def index
     @girls = Girl.order("created_at desc").paginate(page: params[:page], per_page: 30)
     render :layout => "ios" if session[:user_agent].platform == 'iPad'
  end
  
  private
  
  def check_girls_state
    girls = Girl.where(["state = ? ", "working"])
    
    girls.each do |girl|
      last_task = girl.tasks.last
      next if last_task.nil?
      girl.complete_work if last_task.endtime < Time.now
    end
  end
  
end
