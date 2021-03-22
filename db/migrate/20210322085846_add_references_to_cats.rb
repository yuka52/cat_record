class AddReferencesToCats < ActiveRecord::Migration[6.0]
  def change
    add_reference :cats, :user, null: false, foreing_key: true
  end
end
