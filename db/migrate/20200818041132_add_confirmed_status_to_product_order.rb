class AddConfirmedStatusToProductOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :product_orders, :confirmed, :boolean
  end
end
