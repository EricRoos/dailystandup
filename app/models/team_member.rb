class TeamMember < ApplicationRecord
  rolify
  belongs_to :user
  belongs_to :team
  validates_uniqueness_of :user, { scope: :team }
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:member) if self.roles.blank?
  end
end
