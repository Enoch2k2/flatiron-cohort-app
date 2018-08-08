class Cohort < ApplicationRecord
  has_many :student_cohorts
  has_many :users, through: :student_cohorts
  belongs_to :instructor, class: User
end
