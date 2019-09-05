class CreateDuties < ActiveRecord::Migration[5.2]
  def change
    create_table :duties do |t|
      t.belongs_to :location, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.integer :users_rating
      t.integer :locations_rating

      t.timestamps
    end
  end
end
