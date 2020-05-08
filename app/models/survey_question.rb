class SurveyQuestion < ApplicationRecord
  belongs_to :survey, touch: true
  has_many :survey_responses
end
