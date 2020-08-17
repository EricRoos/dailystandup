class CreateIncreaseTeamLimitSkuToProducts < ActiveRecord::Migration[6.0]
  PRODUCT_SKU = 'IncreaseTeamLimit'

  def up
    Product.create(sku: PRODUCT_SKU, price_cents: 499)
  end

  def down
    Product.where(sku: PRODUCT_SKU).destroy_all
  end
end
