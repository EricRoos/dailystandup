class ProductOrder < ApplicationRecord
  belongs_to :product

  belongs_to :payer, polymorphic: true
  delegate :price_cents, to: :product

  scope :confirmed, -> { where(confirmed: true) }

  def confirm_order_payment(payment_id)
    payment_data = PaymentProcessor.new.fetch_payment(payment_id)
    if payment_data[:succeeded] && payment_data[:meta][:product_order_id].to_i == self.id
      update(confirmed: true)
      return true
    end
    update(confirmed: false)
    return false
  end
end
