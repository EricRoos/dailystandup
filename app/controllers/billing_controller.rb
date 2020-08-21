class BillingController < ApplicationController
  before_action :set_team

  def new
    payment_profile = payment_owner.payment_profile
    payment_profile = payment_owner.build_payment_profile(provider: :stripe) unless payment_profile.present?
    payment_profile.save unless payment_owner.persisted?

		@intent = Stripe::SetupIntent.create({
      customer: payment_profile.profile_id
		})
    payment_profile.save
  end

  def success
    redirect_to root_path, notice: 'Card Details Updated'
  end

  protected

  def payment_owner
    return current_user unless @team.present?
    return @team
  end

  def set_team
    @team = Team.find(params[:team_id]) if params[:team_id].present?
  end
end
