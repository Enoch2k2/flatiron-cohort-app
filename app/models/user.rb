class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles
  has_many :student_cohorts, dependent: :destroy
  has_many :cohorts, through: :student_cohorts
  has_many :meetings
  
  validates_uniqueness_of :email
  validates_uniqueness_of :learn_profile, allow_blank: true
  
  before_save :check_github

  belongs_to :current_cohort, class_name: "Cohort", required: false

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

  def only_student?
    roles.count == 1 && roles.first.name == "Student"
  end

  def add_student_role
    if roles.empty?
      roles << Role.find_or_create_by(name: "Student")
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def total_lessons_completed
    total = 0
    meetings.each{|m| total += m.completed_lessons}
    total
  end

  def current_cohort_attributes=(id)
    # checks if user is a student and will add a role if they aren't already a student
    self.add_student_role

    # add left at to cohort student is leaving if they have a current cohort
    if self.student? && self.current_cohort
      self.student_cohorts.find_by(cohort_id: self.current_cohort_id).update(left_at: Date.today)
    end

    # set current_cohort to new cohort
    self.current_cohort = Cohort.find_by_id(id)

    # add joined at to new cohort
    if self.student? && self.current_cohort
      self.student_cohorts.find_or_create_by(cohort_id: self.current_cohort_id).update(joined_at: Date.today)
    end

  end

  def current_cohort_attributes
    self.current_cohort_id if self.current_cohort
  end

  private
    def check_github
      if self.github_username.blank?
        self.github_username = nil
      end
    end
end
