class CreateOccasions < ActiveRecord::Migration
  def change
    create_table :occasions do |t|
      t.string :name
      t.string :description
      t.datetime :date_time
      t.string :date
      t.string :time
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps null: false
    end
  end
end
