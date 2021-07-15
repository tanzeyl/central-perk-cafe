class OrdersController < ApplicationController

  def index
    render "new"
  end

  def create
    new_order = Order.create!(date: Date.today, user_id: @current_user.id, status: "pending")
    OrderItem.where(user_id: @current_user.id)[0].destroy
    redirect_to "/dashboard"
  end

end
