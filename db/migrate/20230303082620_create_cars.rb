class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :company
      t.string :model
      t.integer :price
      t.integer :fuel_type
      t.integer :type
      t.integer :capacity

      t.timestamps
    end
  end
end
