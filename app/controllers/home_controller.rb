class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => :index
  before_filter :check_girls_state
  def index
  end

  def girls
    @venues = Venue.all
   
    if params[:venue_id].blank?
      @girls = Girl.paginate(page: params[:page], per_page: 60)
    else
      @girls = Venue.find(params[:venue_id]).girls.paginate(page: params[:page], per_page: 60)
    end
   
    respond_to do |format|
      format.html do
        render action: "girls" 
      end
      
      format.json do
        @girls.each do |girl|
          girl["img_url"] = girl.pics.first.photo.thumbnail.url
        end 
        render json: @girls 
      end
    end
  end

  def services
    @services = Service.all
    @girls = Service.find(params[:service]).girls unless params[:service].blank?
  end
  
end
