class MenuController < ApplicationController

  def index
    render "index"
  end


  def update
    id = params[:id]
    order = MenuItem.find(id)
    new_order = OrderItem.create!(menu_item_id: order.id,
                                  menu_item_name: order.name,
                                  menu_item_price: order.price,
                                  menu_item_quatity: 1,
                                  user_id: @current_user.id)
    redirect_to "/menu"
  end

  def destroy
    id = params[:id]
    OrderItem.where(id: id)[0].destroy
    redirect_to "/menu"
  end
end
