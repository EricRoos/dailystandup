class AddPaymentOwnerToProductOrder < ActiveRecord::Migration[6.0]
  def change
    add_reference :payment_profiles, :payment_owner, polymorphic: true, index: {name: 'poly_payment_owner'}
  end
end
