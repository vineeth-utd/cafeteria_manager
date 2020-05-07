class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id).conf_and_del.order("id DESC")
    @all_orders = Order.conf_and_del.order("id DESC")
    render "index"
  end

  def new
    @orders = Order.where(user_id: current_user.id).order("id DESC")
    render "new"
  end

  def update
    order = Order.find(params[:id])
    if order.status == "being_created"
      order.status = "order_confirmed"
      order.save!
      flash[:notice] = "Your order with ID:#{order.id} is confirmed!"
      redirect_to menu_items_path
    else
      order.status = "delivered"
      order.delivered_at = DateTime.now + (5.5 / 24)
      order.save!
      redirect_to pending_orders_path
    end
  end

  def pending_orders
    @orders = Order.get_pending_orders.order("id ASC")
    render "pending_orders"
  end
end
