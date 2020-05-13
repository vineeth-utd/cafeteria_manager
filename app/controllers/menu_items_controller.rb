class MenuItemsController < ApplicationController
  def index
    @categories = Menuitem.distinct.pluck(:category)
    #@categories.sort!
    @order = current_user.orders.being_created
    if @order
      @orderitem = @order.orderitems
    end
    render "index"
  end

  def edit
    @menuitem = Menuitem.find(params[:id])
    @categories = Menuitem.distinct.pluck(:category)
  end

  def create
    menu = Menu.active
    menu_item = Menuitem.new(
      menu_id: menu.id,
      name: params[:name],
      description: params[:description],
      price: params[:price],
      category: params[:category],
    )
    if menu_item.save
      flash[:notice] = "New item is created successfully!"
      redirect_to menu_items_path
    else
      flash[:error] = menu_item.errors.full_messages.join(", ")
      redirect_to menu_items_path
    end
  end

  def update
    menu = Menu.active
    menuitem = Menuitem.find(params[:id])
    menuitem.update(
      menu_id: menu.id,
      name: params[:name],
      description: params[:description],
      price: params[:price],
      category: params[:category],
    )
    flash[:notice] = "Item with ID:#{menuitem.id} is updated successfully!"
    redirect_to menu_items_path
  end

  def destroy
    menuitem = Menuitem.find(params[:id])
    menuitem.destroy
    flash[:notice] = "Item with ID:#{menuitem.id} is deleted!"
    redirect_to menu_items_path
  end
end
