class SessionsController < ApplicationController
  #skip_before_action :ensure_user_logged_in

  def new
  end

  def create
    customer = Customer.find_by(email: params[:email])
    if customer && customer.authenticate(params[:password])
      session[:current_user_id] = customer.id
      redirect_to menu_index_path
    else
      flash[:error] = "Your login attempt was invalid. Please try again."
      redirect_to new_session_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to "/"
  end

end
