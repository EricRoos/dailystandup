class PaymentProfile < ApplicationRecord
  belongs_to :payment_owner, polymorphic: true
  before_validation :create_with_provider, on: :create

  validates_presence_of :profile_id

  protected

  def create_with_provider
    return false unless provider.to_sym == :stripe
    if payment_owner.is_a?(User)
      customer_name = payment_owner.full_name
    else
      customer_name = "#{self.payment_owner_type}-#{self.payment_owner_id}"
    end
    self.profile_id = PaymentProcessor.new.create_customer(customer_name)[:customer_id]
  end
end
