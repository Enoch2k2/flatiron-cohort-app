class Cohort < ApplicationRecord
  has_many :student_cohorts
  has_many :students, through: :student_cohorts
  belongs_to :instructor, class_name: "User"

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  before_destroy :destroy_student_cohorts

  def current_students
    students.select{|student| student.current_cohort == self}
  end

  private

    def destroy_student_cohorts
      self.student_cohorts.destroy_all
    end
end
