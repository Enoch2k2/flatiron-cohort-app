class Cohort < ApplicationRecord
  has_many :student_cohorts
  has_many :students, through: :student_cohorts
  belongs_to :instructor, class_name: "User"
end
