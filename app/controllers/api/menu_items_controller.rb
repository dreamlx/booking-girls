module Api
  class MenuItemsController < Api::BaseController
    def index
      @menu_items = MenuItem.where("category_id = #{params[:category_id]}")
    end

    def show
      @menu_item = MenuItem.find(params[:id])
    end
  end
end