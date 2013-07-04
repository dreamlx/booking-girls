class ServiceMenusController < InheritedResources::Base
  def index
    @service_menus = @current_company.service_menus
  end

end
