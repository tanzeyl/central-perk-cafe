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
    OrderItem.where(id: id)[0].destroy
    redirect_to "/menu"
  end
end
