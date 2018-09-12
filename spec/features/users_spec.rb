require 'rails_helper'

RSpec.feature "Users", type: :feature do
  let(:admin_role){create(:admin_role)}
  let(:instructor_role){create(:instructor_role)}
  let(:instructor_without_name){create(:instructor_without_name, roles: [admin_role, instructor_role])}
  let(:instructor){create(:instructor, roles: [admin_role, instructor_role])}
  let(:cohort_1){create(:cohort_1, instructor: instructor)}
  let(:student_1){create(:student_1)}
  let(:student_2){create(:student_2)}
  describe "Users Features" do
    describe "root path" do
      it "routes to edit page if user doesn't have first and last name" do
        login_as(instructor_without_name, scope: :user)
        visit root_path
        expect(page.body).to include("Edit Account")
      end
    end
  end

  describe "Student Features" do
    describe "Student" do
      it "new student path responds with a 200 status code" do
        login_as(instructor, scope: :user)
        visit user_cohort_new_student_path(instructor, cohort_1)
        expect(page.status_code).to eq(200)
      end
    end
  end
end