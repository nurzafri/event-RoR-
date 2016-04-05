class RemoveFieldNameFromTableName < ActiveRecord::Migration
  def change
    remove_column :occasions, :date, :date
    remove_column :occasions, :time_start, :time
    remove_column :occasions, :time_end, :time
  end
end
