class MenusController < ApplicationController
  def index
    before_action :ensure_manager
    render "index"
  end

  def new
  end

  def create
    menu = Menu.new(name: params[:name], active_menu: false)
    if menu.save
      flash[:notice] = "New menu is created!"
      redirect_to menus_path
    else
      flash[:error] = menu.errors.full_messages.join(", ")
      redirect_to menus_path
    end
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
    flash[:notice] = "#{menu.name} is made active!"
    redirect_to menus_path
  end

  def destroy
    menu = Menu.find(params[:id])
    menu.destroy
    flash[:notice] = "Item with ID:#{menu.id} is deleted!"
    redirect_to menus_path
  end
end
