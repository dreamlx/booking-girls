module Api
  class WaitersController < Api::BaseController
    def index
      @waiters = User.all
    end
    
    def show
      @waiters = User.find params[:id]
    end
  end
end