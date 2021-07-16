class MenuItemsController < ApplicationController

  def create
    menu_cat = params[:menu]
    menu_category = MenuCategory.where(name: menu_cat)[0]
    mc_id = menu_category.id
    new_item = MenuItem.new(menu_category_id: mc_id, name: params[:name], description: params[:description], price: params[:price], available: params[:available])
    if new_item.save
      flash[:error] = "Menu Item added successfully."
      redirect_to admin_menu_index_path
    else
      flash[:error] = customer.errors.full_messages.join(", ")
      redirect_to admin_menu_index_path
    end
  end

end
