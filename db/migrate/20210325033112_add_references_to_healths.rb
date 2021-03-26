class AddReferencesToHealths < ActiveRecord::Migration[6.0]
  def change
    add_reference :healths, :user, null: false, foreign_key: true
  end
end
