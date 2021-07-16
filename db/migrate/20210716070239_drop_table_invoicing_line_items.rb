class DropTableInvoicingLineItems < ActiveRecord::Migration[6.1]
  def change
    drop_table :invoicing_line_items
  end
end
