class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.references :team, null: false, foreign_key: true
      t.references :notifiable, polymorphic: true
      t.string :type

      t.timestamps
    end
  end
end
