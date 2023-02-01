class Student < ApplicationRecord
  validates :first_name, :last_name, presence: true

  validates :birthdate, comparison: { less_than: Date.today }

  validates :department, inclusion: { in: %w(CE IT),
                                      message: "Department can't be %{value}" }

  validates :terms, acceptance: true
end
