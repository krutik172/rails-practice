class AddDataToAuthor < ActiveRecord::Migration[7.0]
  def up 
    Author.create(first_name: "Chetan", last_name: "Bhagat", email: "chetanbhaga@gmail.com", dob: Date.new(1974, 4, 22))
    Author.create(first_name: "Amish", last_name: "Thripathi", email: "amishtripathi@gmail.com", dob: Date.new(1974, 10, 18))
  end
end