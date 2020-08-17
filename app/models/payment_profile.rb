class PaymentProfile < ApplicationRecord
  belongs_to :user
  before_validation :create_with_provider, on: :create

  validates_uniqueness_of :user
  validates_presence_of :profile_id

  protected

  def create_with_provider
    return false unless provider.to_sym == :stripe
    self.profile_id = PaymentProcessor.new.create_customer(user.full_name)[:customer_id]
  end
end
