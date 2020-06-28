class TeamCell < Cell::ViewModel
  include ::Cell::Erb

  def sidebar(active_tab='team-members')
    links = [
      { title: 'Team Members',  'tab_name': 'team-members',   url: team_team_members_path(team) },
      { title: 'Activity Feed', 'tab_name': 'activity-feed',  url: team_activities_path(team) },
      { title: 'Manage Team',   'tab_name': 'manage-team',    url: edit_team_path(team) },
    ]
    render locals: { team: model, links: links, active_tab: active_tab }
  end

  def team_members
    render
  end

  def activity_feed
    render
  end

  def manage_team
    render locals: { team: model }
  end

  private

  def team
    model
  end
end