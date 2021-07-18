class MenuController < ApplicationController

  def index
    render "index"
  end

  def create
    new_category = MenuCategory.new(name: params[:name], available: true)
    if new_category.save
      flash[:error] = "New Category Successfully Created."
      redirect_to admin_menu_index_path
    end
  end

  def destroy
    id = params[:id]
    OrderItem.where(id: id).destroy_all
    redirect_to "/menu"
  end

  def update
    id = params[:id]
    orderItem = OrderItem.find(id)
    actual = orderItem.menu_item_quatity.to_i
    update = params[:menu_item_quatity].to_i
    unless actual == 1 and update == -1
      orderItem.menu_item_quatity = actual + update
      unless orderItem.save
        flash[:error] = orderItem.errors.full_messages.join(", ")
      end
    else
      orderItem.destroy
    end
    redirect_to "/menu"
  end

end
