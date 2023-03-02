class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.integer :capicity
      t.boolean :is_active
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
