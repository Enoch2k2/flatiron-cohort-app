class Role < ApplicationRecord
  has_many :user_roles
  has_many :users, through: :user_roles

  scope :student, -> { where("name = 'Student'").first }
  scope :instructor, -> { where("name = 'Instructor'").first }
  scope :admin, -> { where("name = 'Admin'").first }

  def self.add_student(user)
   role = Role.find_by(name: "Student")
   if user.roles.empty?
    user.roles << role
   end
  end

end
