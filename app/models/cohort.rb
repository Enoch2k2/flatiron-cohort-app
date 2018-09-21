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

  def add_student(user)
    user.add_student_role
    user.current_cohort = self
    # If this user is only a student & they haven't been previously added to this cohort
    # then add them and mark them joined at today's date.
    if user.only_student? && !user.cohorts.include?(self)
      user.student_cohorts.create(cohort: self, joined_at: Date.today)
    end
    user.save
  end

  private
    def remove_all_current_students
      current_students.update_all(current_cohort_id: nil)
    end

end
