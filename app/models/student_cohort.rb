class StudentCohort < ApplicationRecord
  belongs_to :cohort
  belongs_to :student, class_name: "User", foreign_key: "user_id"
end
