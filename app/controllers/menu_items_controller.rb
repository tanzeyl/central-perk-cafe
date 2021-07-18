class MenuItemsController < ApplicationController

  def create
    menu_cat = params[:menu]
    menu_category = MenuCategory.where(name: menu_cat)[0]
    mc_id = menu_category.id
    new_item = MenuItem.new(menu_category_id: mc_id, name: params[:name], description: params[:description], price: params[:price], available: true)
    if new_item.save
      flash[:error] = "Menu Item added successfully."
      redirect_to admin_menu_index_path
    else
      flash[:error] = customer.errors.full_messages.join(", ")
      redirect_to admin_menu_index_path
    end
  end

  def update
    temp = OrderItem.where(menu_item_id: params[:id], user_id: @current_user.id)
    order = MenuItem.find(params[:id])
    if temp.count == 0
      new_order = OrderItem.create!(menu_item_id: order.id,
                                    menu_item_name: order.name,
                                    menu_item_price: order.price,
                                    menu_item_quatity: 1,
                                    user_id: @current_user.id)
    else
      flash[:error] = "Item already in cart."
    end
    redirect_to "/menu"
  end

end
