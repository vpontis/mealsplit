class AddOwesToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :owes, :float
  end
end
