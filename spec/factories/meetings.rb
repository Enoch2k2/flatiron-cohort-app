FactoryBot.define do
  factory :meeting do
    user nil
    date "2018-08-24"
    time "MyString"
    current_lesson "MyString"
    completed_lessons 1
    struggling? false
    behind_schedule? false
    knowledge_check 1
    note "MyString"
  end
end
