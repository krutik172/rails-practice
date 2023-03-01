class Customer < ApplicationRecord
  validates :email, uniqueness: true
  validates :phone, format: { with: /\A\d+\z/, message: " should contain numbers only" }, length: { minimum: 10, maximum: 10 }

  has_many :orders, dependent: :destroy
end
