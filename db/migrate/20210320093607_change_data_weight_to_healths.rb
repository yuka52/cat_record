class ChangeDataWeightToHealths < ActiveRecord::Migration[6.0]
  def change
    change_column :healths, :weight, :float
  end
end
