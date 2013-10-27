class ChangeOwesFormatInParticipants < ActiveRecord::Migration
  	def self.up
   		change_column :participants, :owes, :int
  	end

  	def self.down
   		change_column :participants, :owes, :float
  	end
end
