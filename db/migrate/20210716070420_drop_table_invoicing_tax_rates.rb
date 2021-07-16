class DropTableInvoicingTaxRates < ActiveRecord::Migration[6.1]
  def change
    drop_table :invoicing_tax_rates
  end
end
