class CompaniesController < InheritedResources::Base
  before_filter :authenticate_user!
  def create
    @company = Company.new(params[:company])
    if @company.save
      current_user.company = @company
      current_user.save

      redirect_to @company
    else
      render action: "new"
    end
  end
end
