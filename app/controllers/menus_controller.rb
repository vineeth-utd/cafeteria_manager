class MenusController < ApplicationController
  def index
    render "index"
  end

  def new
  end

  def create
    menu = Menu.create!(name: params[:name])
    session[:current_menu_id] = menu.id
    @current_menu = Menu.find(current_menu_id)
  end
end
