class MenuController < ApplicationController

  def index
    render "index"
  end


  def update
    id = params[:id]
    @ID = id
    order = MenuItem.find(id)
    new_order = OrderItem.create!(menu_item_id: order.id, menu_item_name: order.name, menu_item_price: order.price)
    redirect_to "/menu"
  end
end
