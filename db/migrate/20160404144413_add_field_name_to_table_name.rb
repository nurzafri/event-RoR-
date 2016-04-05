class AddFieldNameToTableName < ActiveRecord::Migration
  def change
    add_column :occasions, :time_start, :datetime
    add_column :occasions, :time_end, :datetime
  end
end
