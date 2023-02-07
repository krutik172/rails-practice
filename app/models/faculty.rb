class Faculty < ApplicationRecord
  validates :name, :email, presence: true
  validates :phone, length: { is: 10 }
  validates :email, confirmation: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true, presence: true
  validates :designation, inclusion: { in: %w(Prof Ass.Prof), message: "Designation not valid" }
  validates :designation, exclusion: { in: %w(HOD Sr.Prof), message: "Designation not allowed." }

  after_create :email_validate
  
  after_initialize do |faculty|
    puts "You have initialized a faculty !"
  end

  after_find do |faculty|
    puts "You have found a faculty !"
  end

  after_create do |faculty|
    puts "You have create a faculty !"
  end 

  after_destroy do |faculty|
    puts "faculty object has been destroyed."
  end

  after_update do |faculty|
    puts "faculty has been updated !"
  end

    private 
  
  def email_validate
    puts "Email Validated."
  end 
  



end
