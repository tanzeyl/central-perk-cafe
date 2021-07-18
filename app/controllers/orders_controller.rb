class OrdersController < ApplicationController

  def index
    @total = 0
    render "new"
  end

  def create
    new_order = Order.create!(date: Date.today, user_id: @current_user.id, status: "pending", cost: session[:total_cost])
    flash[:error] = "Order placed successfully!"
    OrderItem.where(user_id: @current_user.id).destroy_all
    redirect_to "/dashboard"
  end

  def history
    render "history"
  end

  def orderupdate
    render "pendingorders"
  end

  def change_status
    id = params[:id]
    order = Order.find(id)
    order.status = "delivered"
    order.save
    redirect_to "/pendingorders"
  end

  def show
    render "singleorder"
  end

end
