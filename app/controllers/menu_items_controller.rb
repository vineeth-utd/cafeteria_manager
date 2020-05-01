class MenuItemsController < ApplicationController
  def index
    @categories = Menuitem.distinct.pluck(:category)
    render "index"
  end

  def new
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
end
