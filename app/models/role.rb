class Role < ApplicationRecord
  has_many :user_roles
  has_many :users, through: :user_roles

  scope :student, -> { where("name = 'Student'").first }
  scope :instructor, -> { where("name = 'Instructor'").first }
  scope :admin, -> { where("name = 'Admin'").first }
end
