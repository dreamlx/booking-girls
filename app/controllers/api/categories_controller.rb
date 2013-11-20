module Api
  class CategoriesController < Api::BaseController
    def index
      @categories = Category.order("created_at DESC")
    end

    def show
      @category = Category.find(params[:id])
    end
  end
end