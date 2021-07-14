class CustomersController < ApplicationController
  #has_many :orders

  def new
    render "customers/new"
  end

  def create
    customer = Customer.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      role: "customer" )
      if customer.save
        session[:current_user_id] = customer.id
        redirect_to "/menu"
      else
        flash[:error] = customer.errors.full_messages.join(", ")
        redirect_to new_customer_path
      end
  end

end
