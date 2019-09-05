class AddCompleteToDuty < ActiveRecord::Migration[5.2]
  def change
    add_column :duties, :complete, :boolean
  end
end
