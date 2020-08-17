class Survey < ApplicationRecord
  belongs_to :team
  has_many :survey_questions
  accepts_nested_attributes_for :survey_questions, allow_destroy: true

  DEFAULT_QUESTIONS = [
    'What did you do yesterday',
    'What are you doing today',
    'What are your blockers',
  ]

  def populate_questions
    DEFAULT_QUESTIONS.each do |q|
      self.survey_questions << SurveyQuestion.new(text: q)
    end
    self
  end
end
