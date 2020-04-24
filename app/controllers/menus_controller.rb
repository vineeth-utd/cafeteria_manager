class MenusController < ApplicationController
  def index
    render "index"
  end

  def new
  end

  def create
    menu = Menu.create!(name: params[:name], active_menu: false)
    #session[:current_menu_id] = menu.id
    redirect_to menus_path
    #@current_menu = Menu.find(current_menu_id)
  end

  def update
    id = params[:id]
    active_menu = params[:active_menu]
    menu = Menu.find(id)
    if active_menu.blank?
      menu.active_menu = false
    else
      menu.active_menu = true
    end
    menu.save!
    redirect_to menus_path
  end
end
