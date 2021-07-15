class ApplicationController < ActionController::Base

  def current_user
    return @current_user if @current_user
    current_user_id = session[:current_user_id]
    if current_user_id
      @current_user = Customer.find(current_user_id)
    else
      nil
    end
  end

end
