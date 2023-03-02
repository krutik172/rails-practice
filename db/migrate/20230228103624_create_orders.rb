class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.integer :total_price
      t.integer :status
      t.timestamps
    end
    add_reference :orders, :customer
    add_reference :orders, :item
  end
end
