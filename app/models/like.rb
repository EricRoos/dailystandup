class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true, touch: true, counter_cache: true
  belongs_to :team_member, touch: true
  after_create :create_activity

  def create_activity
    LikedStandupActivity.create(team: team_member.team, notifiable: self)
  end
end
