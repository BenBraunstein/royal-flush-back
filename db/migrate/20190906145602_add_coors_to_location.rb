class AddCoorsToLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :coords, :string
  end
end
