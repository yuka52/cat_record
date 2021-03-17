class CreateCats < ActiveRecord::Migration[6.0]
  def change
    create_table :cats do |t|
      t.string :name,  null: false
      t.date   :birthday,  null: false
      t.string :favorite
      t.integer :gender_id,  null: false
      t.timestamps
    end
  end
end
