class AddAgeToAuthor < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :Age, :integer
  end
end
