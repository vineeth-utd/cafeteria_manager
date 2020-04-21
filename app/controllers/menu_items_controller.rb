class OrderItemsController < ApplicationController
  def index
    render "index"
  end

  def new
  end

  def create
    menu_item = MenuItems.create!(
      name: params[:name],
      description: params[:description],
      price: params[:price],
    )
  end
end
