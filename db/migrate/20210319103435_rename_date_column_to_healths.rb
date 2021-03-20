class RenameDateColumnToHealths < ActiveRecord::Migration[6.0]
  def change
    rename_column :healths, :date, :recorded_date
  end
end
