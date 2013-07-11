class VenuesController < InheritedResources::Base
  def index
    @venues = @current_company.venues
  end

  def show
  	@venue = Venue.find(params[:id])
  	@girls = Venue.find(params[:id]).girls.paginate(page: params[:page], per_page: 30)
  end
end
