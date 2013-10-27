class RemoveOwesFromParticipant < ActiveRecord::Migration
  def change
    remove_column :participants, :owes
  end
end
