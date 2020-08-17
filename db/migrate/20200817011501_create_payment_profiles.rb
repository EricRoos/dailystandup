class CreatePaymentProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :provider
      t.string :profile_id
      t.timestamps
    end
  end
end
