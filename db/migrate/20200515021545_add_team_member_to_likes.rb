class AddTeamMemberToLikes < ActiveRecord::Migration[6.0]
  def change
    add_reference :likes, :team_member, null: false, foreign_key: true
  end
end
