class RemoveUserFromPaymentProfile < ActiveRecord::Migration[6.0]
  def change
    remove_reference :payment_profiles, :user
  end
end
