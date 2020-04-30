class OrdersController < ApplicationController
  def index
    render "index"
  end

  def new
    render "new"
  end

  def update
    order = Order.find_by(id: params[:order_id])
    #order.status = "order_confirmed"
    order.update!(status: "order_confirmed")
    #order.save!
    redirect_to new_order_path
  end
end
