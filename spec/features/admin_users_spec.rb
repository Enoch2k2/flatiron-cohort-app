require 'rails_helper'

RSpec.feature "Admin Users", type: :feature do
  describe "Index Page" do 
    it "does not allow non-admins to view" do 
      instructor_login 
      visit admin_users_path
      expect(current_path).to eq('/')
      expect(page).to have_content("You are not authorized to perform this action.")
    end

    it "allows admins to edit user roles" do 
      admin_login
      attrs = attributes_for(:instructor)
      instructor = create(:instructor)
      instructor_role = create(:instructor_role)
      student_role = create(:student_role)
      visit admin_users_path
      expect(current_path).to eq(admin_users_path)
      find('tr:nth-child(2)').click_link("Edit")
      check "user_role_ids_#{instructor_role.id}"
      check "user_role_ids_#{student_role.id}"
      submit_form
      expect(instructor.roles).to include(instructor_role)
      expect(instructor.roles).to include(student_role)

      find('tr:nth-child(2)').click_link("Edit")
      uncheck "user_role_ids_#{student_role.id}"
      submit_form
      
      expect(instructor.roles).to include(instructor_role)
      expect(instructor.roles).not_to include(student_role)
    end
  end

  describe "Edit Users" do
    it "allows the ability to move cohorts" do
      admin_login
      cohort_1 = create(:cohort_1)
      cohort_2 = create(:cohort_with_students)
      student_1 = cohort_2.students.first
      visit edit_admin_user_path(student_1)
      select "Cohort 1", from: "user_current_cohort_attributes"
      submit_form
      student_1.reload
      expect(student_1.current_cohort).to eq(cohort_1)
    end
  end
end