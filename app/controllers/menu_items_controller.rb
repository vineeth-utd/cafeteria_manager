class MenuItemsController < ApplicationController
  def index
    @categories = Menuitem.distinct.pluck(:category)
    render "index"
  end

  def edit
    @menuitem = Menuitem.find(params[:id])
    @categories = Menuitem.distinct.pluck(:category)
    render "edit"
  end

  def create
    menu = Menu.active
    menu_item = Menuitem.create!(
      menu_id: menu.id,
      name: params[:name],
      description: params[:description],
      price: params[:price],
      category: params[:category],
    )
    redirect_to menu_items_path
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
    redirect_to menu_items_path
  end

  def destroy
    menuitem = Menuitem.find(params[:id])
    menuitem.destroy
    redirect_to menu_items_path
  end
end
