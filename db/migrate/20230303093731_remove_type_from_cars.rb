class RemoveTypeFromCars < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :type, :integer
  end
end
