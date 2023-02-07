class Student < ApplicationRecord
  validates :first_name, :last_name, presence: true

  validates :birthdate, comparison: { less_than: Date.today }

  validates :department, inclusion: { in: %w(CE IT),
                                      message: "Department can't be %{value}" }

  validates :terms, acceptance: true

  after_create :send_welcome_mail unless: :skip_sending_welcome_email
  #when we want to skip this call back, we can save skip_sending_welcome_email = true
  before_create :check_length
  before_validation :check_date
  after_validation :confirm_date
  after_initialize do |student|
    puts "You have initialized a Student !"
  end

  after_find do |student|
    puts "You have found a Student !"
  end

  after_create do |student|
    puts "You have create a Student !"
  end 

  after_destroy do |student|
    puts "Student object has been destroyed."
  end

  after_update do |student|
    puts "Student has been updated !"
  end

  after_touch do |student|
    puts "You have touched a student."
  end


  private 

  def check_date
    puts "Date Chacked."
  end

  def confirm_date 
    puts "Date checked after validation."
  end

  def check_length
    if first_name.length > 2 
        return true
    else
        errors.add( :base, "name length should be more then 2 letter.")
        puts "name length should be more then 2 letter."

    end 
  end

end
