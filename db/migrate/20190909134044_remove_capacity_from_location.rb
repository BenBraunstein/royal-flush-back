class RemoveCapacityFromLocation < ActiveRecord::Migration[5.2]
  def change
    remove_column :locations, :capacity, :string
  end
end
