class OrderItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
    menu_item = MenuItem.find(params[:menu_item_id])
    order = current_user.orders.being_created ? current_user.orders.being_created : Order.create!(user_id: current_user.id)
    order_item = OrderItem.create!(
      order_id: order.id,
      menu_item_id: menu_item.id,
      menu_item_name: menu_item.name,
      menu_item_price: menu_item.price,
    )
    redirect_to menu_items_path
  end
end
