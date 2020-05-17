class AddActorToActivity < ActiveRecord::Migration[6.0]
  def change
    add_reference :activities, :actor, polymorphic: true
  end
end
