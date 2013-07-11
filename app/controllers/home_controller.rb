class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => :index
  before_filter :check_girls_state
  def index
  end

  def venues
    @venues = @current_company.venues
   
    if params[:venue].blank?
      @girls = @current_company.girls.paginate(page: params[:page], per_page: 30)
    else
      @girls = Venue.find(params[:venue]).girls.paginate(page: params[:page], per_page: 30)
    end
  end

  def services
    @service_menus = @current_company.service_menus
    if params[:service_menu].blank?
      @girls = @current_company.girls.where("state <> ?", "getoff").paginate(page: params[:page], per_page: 30)
    else
      @girls = ServiceMenu.find(params[:service_menu]).girls.paginate(page: params[:page], per_page: 30)
    end
  end

  def girls
    @girls = @current_company.girls.paginate(page: params[:page], per_page: 30)
  end
  
end
