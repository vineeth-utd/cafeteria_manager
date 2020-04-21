class OrdersController < ApplicationController
  def index
    #render "index"
  end

  def new
  end

  def create
    order = Orders.create!(date: Date.today)
  end
end
