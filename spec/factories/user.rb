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

  factory :instructor, class_name: User do
    user
    instructor_role
  end

  # # This will use the User class (Admin would have been guessed)
  # factory :admin, class: User do
  #   first_name "Admin"
  #   last_name  "User"
  #   admin      true
  # end
end