class TeamMember < ApplicationRecord
  rolify
  belongs_to :user
  belongs_to :team, touch: true
  has_many :standup_reports, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates_uniqueness_of :user, { scope: :team }
  after_create :assign_default_role

  delegate :gravatar_url, :full_name, :first_name, :last_name, to: :user

  def can_perform_standup?
    standup_reports.where("DATE(created_at) >= ?", Time.now.to_date).count == 0
  end

  def assign_default_role
    self.add_role(:member) if self.roles.blank?
  end
end
