class Meeting < ApplicationRecord
  belongs_to :user

  validates :date, presence: true
  validates :time, presence: true
  validates :current_lesson, presence: true
  validates :completed_lessons, presence: true
end
