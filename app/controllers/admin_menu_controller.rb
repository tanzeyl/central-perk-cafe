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

  def add_user
    render "add_user"
  end

  def add_admin
    id = params[:id]
    item = Customer.find(id)
    item.role = "admin"
    item.save
    redirect_to "/add_user"
  end

  def add_clerk
    id = params[:id]
    item = Customer.find(id)
    item.role = "clerk"
    item.save
    redirect_to "/add_user"
  end

end
