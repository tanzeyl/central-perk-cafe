class DropTableInvoicingLedgerItems < ActiveRecord::Migration[6.1]
  def change
    drop_table :invoicing_ledger_items
  end
end
