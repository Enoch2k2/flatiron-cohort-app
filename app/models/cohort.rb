class Cohort < ApplicationRecord
  has_many :student_cohorts
  has_many :students, through: :student_cohorts
  belongs_to :instructor, class_name: "User"

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
