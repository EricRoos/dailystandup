class StandupReport < ApplicationRecord
  belongs_to :team_member, touch: true
  has_many :survey_responses, dependent: :delete_all
  has_many :likes, as: :likeable
  accepts_nested_attributes_for :survey_responses
  after_create :create_activity

  validate :check_standup_completeness!

  def self.build_report(team_member)
    team_member.standup_reports.build.tap do |standup|
      team_member.team.survey.survey_questions.each do |survey_question|
        standup.survey_responses.build({survey_question: survey_question})
      end
    end
  end

  def create_activity
    Activities::StandupPosted.create(team: team_member.team, notifiable: self, actor: team_member)
  end

 
  private

  def check_standup_completeness!
    #self.errors[:survey_responses] << 'missing all responses'
  end 
end
