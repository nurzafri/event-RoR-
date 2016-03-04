class AddColumnToOccasion < ActiveRecord::Migration
  def change
    add_reference :occasions, :user, index: true, foreign_key: true
  end
end
