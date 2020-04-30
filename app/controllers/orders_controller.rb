class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id)
    render "index"
  end

  def new
    @orders = Order.where(user_id: current_user.id)
    render "new"
  end

  def update
    order = Order.find_by(id: params[:order_id])
    #order = Order.where(user_id: current_user.id).find_by(id: params[:order_id])
    #order.status = "order_confirmed"
    order.update!(status: "order_confirmed")
    #order.save!
    redirect_to new_order_path
  end
end
