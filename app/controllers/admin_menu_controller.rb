class AdminMenuController < ApplicationController

  def index
    render "index"
  end

  def edit_menu
    render "add_new"
  end

  def add_items
    id = params[:id]
    item = MenuItem.find(id)
    if item.available == true
      item.available = false
      item.save
    else
      item.available = true
      item.save
    end
    redirect_to "/edit_menu"
  end

  def add_cat
    id = params[:id]
    item = MenuCategory.find(id)
    if item.available == true
      item.available = false
      item.save
    else
      item.available = true
      item.save
    end
    redirect_to "/edit_menu"
  end

end
