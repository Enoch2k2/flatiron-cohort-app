FactoryBot.define do
  # factory :user do
  #   first_name "John"
  #   last_name  "Doe"
  #   admin false
  # end

  factory :cohort_1, class: Cohort do
    instructor
    name "Cohort 1"
    start_date Date.new(2018, 7, 15)
    end_date Date.new(2018, 9, 7)

    factory :cohort_with_students do 
      name "Cohort 2 (with students)"

      after(:create) do |cohort, evaluator|
        student_1 = create(:student_1)
        student_2 = create(:student_2)
        [student_1, student_2].each do |student|
          student.current_cohort = cohort
          student.student_cohorts.create(cohort: cohort, joined_at: Date.today)
          student.save
        end
      end
    end
  end


  # # This will use the User class (Admin would have been guessed)
  # factory :admin, class: User do
  #   first_name "Admin"
  #   last_name  "User"
  #   admin      true
  # end
end