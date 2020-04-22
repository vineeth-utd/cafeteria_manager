class MenuItemsController < ApplicationController
  def index
    render "index"
  end

  def new
  end

  def create
    menu_item = Menuitem.create!(
      name: params[:name],
      description: params[:description],
      price: params[:price],
    )
    redirect_to menu_items_path
  end
end
