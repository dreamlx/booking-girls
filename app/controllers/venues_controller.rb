class VenuesController < InheritedResources::Base
  before_filter :authenticate_user!
  def index
    @venues = @current_company.venues
  end

  def show
  	@venue = Venue.find(params[:id])
  	@technicians = Venue.find(params[:id]).technicians.paginate(page: params[:page], per_page: 30)
  end
end
