class AddPayerToProductOwner < ActiveRecord::Migration[6.0]
  def change
    add_reference :product_orders, :payer, polymorphic: true
  end
end
