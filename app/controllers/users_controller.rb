class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    ensure_manager
    render "index"
  end

  def new
    render "/users/new"
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
    if user.role == "User"
      user.role = "Billing-Clerk"
    else
      user.role = "User"
    end
    user.save!
    redirect_to users_path
  end
end
