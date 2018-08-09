FactoryBot.define do
  # factory :user do
  #   first_name "John"
  #   last_name  "Doe"
  #   admin false
  # end

  factory :user do
    email "test@test.com"
    password "testtest"
  end

  factory :instructor, class: User do
    email "test@test.com"
    password "testtest"
  end

  factory :student, class: User do
    email "test@test.com"
    password "testtest"
    first_name "Test"
    last_name "Test"
    slack_username "Test2k2"
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