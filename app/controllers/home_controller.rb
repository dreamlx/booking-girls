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
    @service_menus = ServiceMenu.all
    if params[:service_menu].blank?
      @girls = Girl.where("state <> ?", "getoff").paginate(page: params[:page], per_page: 30)
    else
      @girls = ServiceMenu.find(params[:service_menu]).girls.paginate(page: params[:page], per_page: 30)
    end
  end
  
end
