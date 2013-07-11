class ServiceMenusController < InheritedResources::Base
  def index
    @service_menus = @current_company.service_menus
  end

  def show
  	@service_menu = ServiceMenu.find(params[:id])
  	@girls = ServiceMenu.find(params[:id]).girls.paginate(page: params[:page], per_page: 30)
  end

end
