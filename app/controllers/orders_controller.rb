class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id).conf_and_del.order("id DESC")
    @all_orders = Order.conf_and_del.order("id DESC")
    render "index"
  end

  def new
    @order = @current_user.orders.being_created
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
    ensure_not_user
    @orders = Order.get_pending_orders.order("id ASC")
    render "pending_orders"
  end

  def reports
    ensure_manager
    from = Date.parse(params[:from])
    to = Date.parse(params[:to])
    @orders = Order.where("delivered_at >= ? AND delivered_at <= ? AND user_id = ?", from, to, params[:id])
    render "reports"
  end

  def invoice
    ensure_manager
    render "invoice"
  end
end
