class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    ensure_manager
    render "index"
  end

  def new
    render "/users/new"
  end

  def edit
    ensure_user_logged_in
  end

  def create
    user = User.new(
      role: "User",
      first_name: params[:first_name].titlecase,
      last_name: params[:last_name].titlecase,
      email: params[:email],
      password: params[:password],
    )
    if user.save
      session[:current_user_id] = user.id
      redirect_to "/"
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  def update
    user = User.find(params[:id])
    page = params[:page].to_i
    if page == 0
      if user.role == "User"
        user.role = "Billing-Clerk"
      else
        user.role = "User"
      end
      user.save!
      redirect_to users_path
    end
    if page == 1
      user.update(
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email],
        phone: params[:phone],
        address: params[:address],
      )
      flash[:notice] = "Profile updated successfully"
      redirect_to menu_items_path
    end
  end
end
