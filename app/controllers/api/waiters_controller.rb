module Api
  class WaitersController < Api::BaseController
    def index
      @waiters = Technician.where(role: 'waiter')
    end
    
    def show
      @waiters = Technician.find params[:id]
    end
  end
end