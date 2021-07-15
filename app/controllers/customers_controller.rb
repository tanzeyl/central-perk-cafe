class CustomersController < ApplicationController
  skip_before_action :ensure_user_logged_in

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
        redirect_to "/dashboard"
      else
        flash[:error] = customer.errors.full_messages.join(", ")
        redirect_to new_customer_path
      end
  end

  def destroy
    id = params[:id]
    user = Customer.find(id)
    user.destroy
    redirect_to "/"
  end

end
