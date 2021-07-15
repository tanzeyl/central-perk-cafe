class OrdersController < ApplicationController
  #before_action :authenticate_user

  def new
    render "new"
  end

  def index
    render "new"
  end

end
