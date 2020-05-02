class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id).conf_and_del
    @all_orders = Order.conf_and_del
    render "index"
  end

  def new
    @orders = Order.where(user_id: current_user.id)
    render "new"
  end

  def update
    order = Order.find(params[:id])
    order.status = "order_confirmed"
    order.save!
    redirect_to menu_items_path
  end
end
