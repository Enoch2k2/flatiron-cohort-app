class StudentCohort < ApplicationRecord
  belongs_to :cohort
  belongs_to :student, class: User
end
