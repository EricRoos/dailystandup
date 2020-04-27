class CreateSurveyQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :survey_questions do |t|
      t.references :survey, null: false, foreign_key: true
      t.string :text

      t.timestamps
    end
  end
end
