class MenusController < ApplicationController
  def index
    render "index"
  end

  def new
  end

  def create
    menu = Menu.create!(name: params[:name], active_menu: false)
    redirect_to menus_path
    session[:current_menu_id] = menu.id
    #@current_menu = Menu.find(current_menu_id)
  end

  def update
    id = params[:id]
    active_menu = params[:active_menu]
    menu = Menu.find(id)
    menu.active_menu = active_menu
    menu.save!
    redirect_to menus_path
  end
end
