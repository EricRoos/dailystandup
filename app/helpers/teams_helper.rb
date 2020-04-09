module TeamsHelper
  def can_manage_team?(team, user)
    team.team_members
      .where(user_id: user.id)
      .first
      &.has_role?(:owner)
  end
end
