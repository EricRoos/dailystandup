class BillingController < ApplicationController
  def new
    payment_profile = current_user.payment_profile
    payment_profile = current_user.build_payment_profile(provider: :stripe) unless payment_profile.present?
		@intent = Stripe::SetupIntent.create({
      customer: payment_profile.profile_id
		})
  end
end
