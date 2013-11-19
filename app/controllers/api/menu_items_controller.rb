module Api
  class MenuItemsController < Api::BaseController
    def index
      if params[:category_id].blank?
        @menu_items = MenuItem.all
      else
        @menu_items = MenuItem.where("category_id = #{params[:category_id]}")
      end
    end

    def show
      @menu_item = MenuItem.find(params[:id])
    end
  end
end