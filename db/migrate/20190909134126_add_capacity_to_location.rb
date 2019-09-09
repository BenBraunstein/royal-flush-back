class AddCapacityToLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :capacity, :integer
  end
end
