class Faculty < ApplicationRecord
  validates :name, :email, presence: true
  validates :phone, length: { is: 10 }
  validates :email, confirmation: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true, presence: true
  validates :designation, inclusion: { in: %w(Prof Ass.Prof), message: "Designation not valid" }
  validates :designation, exclusion: { in: %w(HOD Sr.Prof), message: "Designation not allowed." }
end
