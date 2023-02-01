class ChangePhoneInFaculty < ActiveRecord::Migration[7.0]
  def change
    change_column :faculties, :phone, :string
  end
end
