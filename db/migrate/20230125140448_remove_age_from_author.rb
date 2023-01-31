class RemoveAgeFromAuthor < ActiveRecord::Migration[7.0]
  def change
    remove_column :authors, :Age, :integer
  end
end
