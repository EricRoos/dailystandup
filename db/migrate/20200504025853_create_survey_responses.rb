class CreateSurveyResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :survey_responses do |t|
      t.references :standup_report, null: false, foreign_key: true
      t.references :survey_question, null: false, foreign_key: true
      t.text :answer

      t.timestamps
    end
  end
end
