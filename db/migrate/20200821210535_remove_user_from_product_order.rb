class RemoveUserFromProductOrder < ActiveRecord::Migration[6.0]
  def change
    remove_reference :product_orders, :user
  end
end
