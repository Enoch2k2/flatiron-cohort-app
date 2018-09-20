class Cohort < ApplicationRecord
  has_many :student_cohorts, dependent: :destroy
  has_many :students, through: :student_cohorts
  belongs_to :instructor, class_name: "User"

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  before_destroy :remove_all_current_students

  def current_students
    students.where("current_cohort_id = ?", self.id)
  end

  private
    def remove_all_current_students
      current_students.update_all(current_cohort_id: nil)
    end

end
