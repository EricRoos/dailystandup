class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :sku
      t.integer :price_cents

      t.timestamps
    end
  end
end
