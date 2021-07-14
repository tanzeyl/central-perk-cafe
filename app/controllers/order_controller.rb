class OrdersController < ApplicationController
  #before_action :authenticate_user

  def new
  end

  def index
    render "new"
  end

  # def checkout
  #   render "checkout"
  # end
end
