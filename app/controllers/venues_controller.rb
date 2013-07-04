class VenuesController < InheritedResources::Base
  def index
    @venues = @current_company.venues
  end
end
