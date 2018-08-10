FactoryBot.define do
  # factory :user do
  #   first_name "John"
  #   last_name  "Doe"
  #   admin false
  # end

  factory :user do
    email "test2@test.com"
    password "testtest"
  end

  factory :instructor, class: User do
    email "test3@test.com"
    password "testtest"
    first_name "Bob"
    last_name "Not Bob"
  end

  factory :instructor_without_name, class: User do
    email "test4@test.com"
    password "testtest"
  end

  factory :student_1, class: User do
    email "test5@test.com"
    password "testtest"
    first_name "Test"
    last_name "Test"
    slack_username "Test2k2"
    current_lesson "Intro to HTML"
    completed_lessons 15
  end

  factory :student_2, class: User do
    email "test6@test.com"
    password "testtest"
    first_name "Test2"
    last_name "Test2"
    slack_username "TestSlack"
    current_lesson "Intro to HTML"
    completed_lessons 15
  end

  # # This will use the User class (Admin would have been guessed)
  # factory :admin, class: User do
  #   first_name "Admin"
  #   last_name  "User"
  #   admin      true
  # end
end