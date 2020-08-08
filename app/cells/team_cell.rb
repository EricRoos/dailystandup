class TeamCell < Cell::ViewModel
  include ::Cell::Erb

  def sidebar(active_tab='team-members')
    links = [
      { title: 'Post Standup',   'tab_name': 'post-standup',    url: new_team_standup_report_path(team), icon: 'plus' },
      { title: 'Team Members',  'tab_name': 'team-members',   url: team_team_members_path(team), icon: 'user' },
      { title: 'Activity Feed', 'tab_name': 'activity-feed',  url: team_activities_path(team), icon: 'list' },
      { title: 'Manage Team',   'tab_name': 'manage-team',    url: edit_team_path(team), icon: 'cog' },
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
