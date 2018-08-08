FactoryBot.define do
  factory :student_role, class: Role do
    name "Student"
  end

  factory :instructor_role, class: Role do
    name "Instructor"
  end

  factory :admin_role, class: Role do
    name "Admin"
  end
end
