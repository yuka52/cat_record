class AddCommentToHealths < ActiveRecord::Migration[6.0]
  def change
    add_column :healths, :comment, :string
  end
end
