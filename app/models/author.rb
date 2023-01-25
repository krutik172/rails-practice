class Author < ApplicationRecord
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :email, uniqueness: true

  # Will check this afterwards if get time
  #   validate :dob_should_earlier_than_today

  #   require "date"

  #   private

  #   def dob_should_earlier_than_today
  #     # if !(:dob) < Date.today)
  #     if !(dob < Date.today)
  #       errors.add(:dob, "DOB is not proper.")
  #     end
  #   end
end
