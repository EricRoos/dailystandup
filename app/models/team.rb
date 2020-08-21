class Team < ApplicationRecord
  has_many :team_members, dependent: :destroy
  has_one :survey, dependent: :destroy
  accepts_nested_attributes_for :survey, update_only: true
  has_many :activities, dependent: :destroy

  has_one :payment_profile, as: :payment_owner
  has_many :product_orders, as: :payer

  after_create :post_event

  def creator
    team_members.detect { |t| t.has_role?(:owner) }
  end
  private

  def post_event
    Activities::TeamCreated.create(notifiable: self, actor: creator, team: self)
  end

end
