class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :student_cohorts
  has_many :cohorts, through: :student_cohorts
  has_many :meetings

  def instructed_cohorts
    Cohort.where("instructor_id = ?", self.id)
  end

  def admin?
    roles.any?{|role| role.name == "Admin"}
  end

  def instructor?
    roles.any?{|role| role.name == "Instructor"}
  end

  def student?
    roles.any?{|role| role.name == "Student"}
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def total_lessons_completed
    total = 0
    meetings.each{|m| total += m.completed_lessons}
    total
  end
end
