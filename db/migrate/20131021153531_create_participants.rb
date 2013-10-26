class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name
      t.string :email
      t.boolean :payer
      t.integer :meal_id

      t.timestamps
    end
  end
end
