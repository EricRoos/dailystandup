class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true, touch: true, counter_cache: true
  belongs_to :team_member, touch: true
  after_create :create_activity

  def create_activity
    if likeable.is_a?(StandupReport)
      Activities::LikedStandup.create(team: team_member.team, notifiable: self, actor: team_member)
    end
  end
end
