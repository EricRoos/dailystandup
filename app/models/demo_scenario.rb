class DemoScenario
  NUM_MEMBERS = 8
  PAST_DAYS_TO_RUN = 10

  def run
    SurveyResponse.destroy_all
    StandupReport.destroy_all
    SurveyQuestion.destroy_all
    Survey.destroy_all
    Activity.destroy_all
    TeamMember.destroy_all
    Team.destroy_all
    User.destroy_all
    current_user = User.create({first_name: 'demo', last_name: 'user', password: 'test123456', email: 'demo@1.com'})
    team = Team.new(name: '[Auto] Demo Scenario Team')
    team.build_survey.populate_questions
    team.save
    new_team_member = TeamMember.new(user: current_user)
    team.team_members << new_team_member
    new_team_member.add_role(:owner)

    (1..NUM_MEMBERS).each do |i|
      user = User.create({first_name: 'demo', last_name: "user#{i}", password: 'test123456', email: "demo_user@#{i}.com"})
      TeamMember.create(user: user, team: team)
    end

    (0..PAST_DAYS_TO_RUN).each do |days|
      Timecop.travel(Date.today - days)
      TeamMember.where(team_id: team.id).each do |team_member|
        report = StandupReport.build_report(team_member)
        report.survey_responses.each { |s| s.answer = 'foo' }
        report.save
      end
      Timecop.return
    end
  end
end
