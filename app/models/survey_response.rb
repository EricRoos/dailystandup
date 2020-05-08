class SurveyResponse < ApplicationRecord
  belongs_to :standup_report, touch: true
  belongs_to :survey_question, touch: true
end
