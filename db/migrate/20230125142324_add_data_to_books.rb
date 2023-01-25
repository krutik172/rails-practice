class AddDataToBooks < ActiveRecord::Migration[7.0]
  def up
    Book.create(name: "Shiva Triology Part 1", price: 300, author_id: 3)
    Book.create(name: "Shiva Triology Part 2", price: 300, author_id: 3)
    Book.create(name: "Two States", price: 500, author_id: 2)
  end
end
