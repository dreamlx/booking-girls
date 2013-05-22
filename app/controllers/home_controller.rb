class HomeController < ApplicationController
  before_filter :check_girls_state
  def index
    @venues = Venue.all
   
    if params[:venue_id].blank?
      @girls = Girl.paginate(page: params[:page], per_page: 60)
    else
      @girls = Venue.find(params[:venue_id]).girls.paginate(page: params[:page], per_page: 60)
    end
   
    respond_to do |format|
      format.html do
        if session[:user_agent].platform == 'iPad' 
          render :layout => "ios" 
        else
          render action: "index" 
        end
      end
      
      format.json do
        @girls.each do |girl|
          girl["img_url"] = girl.pics.first.photo.thumbnail.url
        end 
        render json: @girls 
      end
    end
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
