class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :payer_id
      t.integer :amount
      t.integer :owee_id

      t.timestamps
    end
  end
end
