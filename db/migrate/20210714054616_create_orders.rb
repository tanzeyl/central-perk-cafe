class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.date :date
      t.bigint :user_id

      t.timestamps
    end
  end
end
