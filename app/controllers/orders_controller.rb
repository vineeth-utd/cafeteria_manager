class OrdersController < ApplicationController
  def index
    render "index"
  end

  def new
    render "new"
  end

  def update
    order = Order.find_by(id: params[:order_id])
    order.status = "order_confirmed"
  end
end
