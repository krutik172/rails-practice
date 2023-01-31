class UpDownDemo < ActiveRecord::Migration[7.0]
  def up
    Book.all.each do |t|
      t.price += 100
    end

    def down
      Book.all.each do |t|
        t.price -= 100
      end
    end
  end
end
