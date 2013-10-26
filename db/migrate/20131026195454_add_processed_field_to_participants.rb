class AddProcessedFieldToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :processed, :boolean, default: false
  end
end
