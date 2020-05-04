class SurveyResponse < ApplicationRecord
  belongs_to :standup_report
  belongs_to :survey_question
end
