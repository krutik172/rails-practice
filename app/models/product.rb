class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true
  validate :price_can_not_be_less_then_zero

  after_save :print_confitmation

  private

  def price_can_not_be_less_then_zero
    puts "validation check"

    if price < 0
      errors.add(:price, "Cannot be less than zero.")
    end
  end

  def print_confitmation
    puts "Product saved !"
  end
end




