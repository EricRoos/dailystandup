class CreateStandupReports < ActiveRecord::Migration[6.0]
  def change
    create_table :standup_reports do |t|
      t.references :team_member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
