class AddLikesCountToStandupReport < ActiveRecord::Migration[6.0]
  def change
    add_column :standup_reports, :likes_count, :integer, default: 0
  end
end
