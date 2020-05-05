class MenusController < ApplicationController
  def index
    render "index"
  end

  def new
  end

  def create
    menu = Menu.create!(name: params[:name], active_menu: false)
    flash[:notice] = "New menu is created!"
    redirect_to menus_path
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
    flash[:notice] = "#{menu.name} is made active"
    redirect_to menus_path
  end

  def destroy
  end
end
