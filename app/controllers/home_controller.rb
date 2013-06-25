class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => :index
  before_filter :check_girls_state
  def index
  end

  def venues
    @venues = Venue.all
   
    if params[:venue].blank?
      @girls = Girl.paginate(page: params[:page], per_page: 30)
    else
      @girls = Venue.find(params[:venue]).girls.paginate(page: params[:page], per_page: 30)
    end
  end

  def services
    @services = Service.all
    if params[:service].blank?
      @girls = Girl.where("state <> ?", "getoff").paginate(page: params[:page], per_page: 30)
    else
      @girls = Service.find(params[:service]).girls.paginate(page: params[:page], per_page: 30)
    end
  end
  
end
