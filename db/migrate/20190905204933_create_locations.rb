class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :capacity
      t.string :name
      t.integer :price
      t.float :rating

      t.timestamps
    end
  end
end
