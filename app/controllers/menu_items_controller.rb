class MenuItemsController < ApplicationController
  def index
    #@menu = Menu.of_menu(current_menu)
    render "index"
  end

  def new
  end

  def create
    menu_item = Menuitem.create!(
      #menu_id: current_menu.id,
      name: params[:name],
      description: params[:description],
      price: params[:price],
    )
    redirect_to menu_items_path
  end
end
