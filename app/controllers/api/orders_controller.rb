module Api
  class OrdersController < Api::BaseController
    def index
      @orders = Order.all
    end

    def show
      @order = Order.find(params[:id])
    end
    def create
      @order = Order.new(params[:order])

      if @order.save
        render json: @order, status: :created, success: true, message: '下单成功'
      else
        render json: @order, status: :failed, success: false, message: '无法下单，请联系管理员'
      end
    end
  end
end