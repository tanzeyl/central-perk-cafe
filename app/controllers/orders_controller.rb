class OrdersController < ApplicationController

  def index
    render "new"
  end

  def create
    new_order = Order.create!(date: Date.today, user_id: session[:current_user_id], status: "pending")
    redirect_to "/menu"
  end

end
