class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => :index
  before_filter :check_girls_state
  def index
    redirect_to '/companies/new' if @current_company.nil?
  end

  def venues
    @venues = @current_company.venues
  end

  def services
    @service_menus = @current_company.service_menus
  end

  def girls
    @girls = @current_company.girls.paginate(page: params[:page], per_page: 30)
  end
  
end
