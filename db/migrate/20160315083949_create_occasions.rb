class CreateOccasions < ActiveRecord::Migration
  def change
    create_table :occasions do |t|
      t.string :name
      t.string :description
      t.string :venue
      t.datetime :date
      t.decimal :latitude
      t.decimal :longitude
      t.references :user, index: true, foreign_key: true
      t.references :organization, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end