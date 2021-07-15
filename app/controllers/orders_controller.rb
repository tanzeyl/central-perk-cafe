class OrdersController < ApplicationController
  #before_action :authenticate_user

  def new
  end

  def index
    render "new"
  end

end
