class UsersController < InheritedResources::Base
	def index
		@users = @current_company.users
	end

  def new
    @user = User.new
  end


end
