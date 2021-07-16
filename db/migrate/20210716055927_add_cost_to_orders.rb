class AddCostToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :cost, :bigint
  end
end
