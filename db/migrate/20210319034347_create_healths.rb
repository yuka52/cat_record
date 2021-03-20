class CreateHealths < ActiveRecord::Migration[6.0]
  def change
    create_table :healths do |t|
      t.date :date, null: false
      t.integer :food_id,  null: false
      t.integer :tulle_id, null: false
      t.integer :play_id,  null: false
      t.integer :weight
      t.integer :poop_id,  null: false
      t.integer :pee_id,   null: false
      t.references :cat,   null: false, foreing_key: true
      t.timestamps
    end
  end
end
