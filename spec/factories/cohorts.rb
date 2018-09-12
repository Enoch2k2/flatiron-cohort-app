FactoryBot.define do
  # factory :user do
  #   first_name "John"
  #   last_name  "Doe"
  #   admin false
  # end

  factory :cohort_1, class: Cohort do
    name "Cohort 1"
    start_date Date.new(2018, 7, 15)
    end_date Date.new(2018, 9, 7)
  end

  # # This will use the User class (Admin would have been guessed)
  # factory :admin, class: User do
  #   first_name "Admin"
  #   last_name  "User"
  #   admin      true
  # end
end