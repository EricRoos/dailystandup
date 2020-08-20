class AddPaymentMethodToProductOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :product_orders, :payment_method_source, :string
    add_column :product_orders, :payment_method_id, :string
  end
end
