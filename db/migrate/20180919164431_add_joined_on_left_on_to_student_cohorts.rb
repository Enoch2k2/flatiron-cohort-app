class AddJoinedOnLeftOnToStudentCohorts < ActiveRecord::Migration[5.2]
  def change
    add_column :student_cohorts, :left_at, :date
    add_column :student_cohorts, :joined_at, :date
  end
end
