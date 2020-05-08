class OrderItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
    menu_item = Menuitem.find(params[:menu_item_id])
    order = current_user.orders.being_created ?
      current_user.orders.being_created :
      Order.create!(user_id: current_user.id, status: "being_created")
    order_item = Orderitem.new(
      order_id: order.id,
      menu_item_id: menu_item.id,
      menu_item_name: menu_item.name,
      menu_item_price: menu_item.price,
      qty: params[:qty],
    )
    if order_item.save
      if @current_user.role == "User"
        flash[:notice] = "Item successfully added to your cart!"
      else
        flash[:notice] = "Item successfully added to cart!"
      end
      redirect_to menu_items_path
    end
  end

  def update
    orderitem = Orderitem.find(params[:id])
    symbol = params[:symbol]
    symbol = symbol.to_i
    if symbol == 1
      orderitem.qty = orderitem.qty + 1
    end
    if symbol == 0
      orderitem.qty = orderitem.qty - 1
    end
    orderitem.save!
    if orderitem.qty == 0
      orderitem.destroy
    end
    redirect_to new_order_path
  end

  def destroy
    id = params[:id]
    orderitem = Orderitem.find(id)
    orderitem.destroy
    if @current_user.role == "User"
      flash[:notice] = "Item successfully removed your cart!"
    else
      flash[:notice] = "Item successfully removed from Offline cart!"
    end
    redirect_to new_order_path
  end
end
