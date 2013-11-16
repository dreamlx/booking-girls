# coding:utf-8
module Api
  class MenuOrdersController < Api::BaseController
    def index
      @menu_orders = MenuOrder.all
    end

    def show
      @menu_order = MenuOrder.find(params[:id])
    end
    
    def create
      @menu_order = MenuOrder.new(params[:menu_order])

      if @order.save
        render json: @menu_order, status: :created, success: true, message: '下单成功'
      else
        render json: @menu_order, status: :failed, success: false, message: '无法下单，请联系管理员'
      end
    end
  end
end