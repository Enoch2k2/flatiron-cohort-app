require 'rails_helper'

RSpec.feature "Cohorts", type: :feature do
  let(:admin_role){create(:admin_role)}
  let(:instructor_role){create(:instructor_role)}
  let(:instructor){create(:instructor, roles: [admin_role, instructor_role])}
  let(:cohort_1){create(:cohort_1, instructor: instructor)}
  let(:student_1){create(:student_1)}
  let(:student_2){create(:student_2)}
  describe "Cohort index page Features" do
    it "cohorts index page returns 200 status code" do
      login_as(instructor, :scope => :user)
      visit user_cohorts_path(instructor)
      expect(page.status_code).to eq(200)
    end

    it "displays links to all of the instructor's cohorts" do
      StudentCohort.create(student: student_1, cohort: cohort_1)
      StudentCohort.create(student: student_2, cohort: cohort_1)
      instructor.update(cohorts: [cohort_1])
      login_as(instructor, :scope => :user)
      visit user_cohorts_path(instructor)
      expect(page.body).to have_link(cohort_1.name)
    end

    it "has a link to create a new cohort" do
      StudentCohort.create(student: student_1, cohort: cohort_1)
      StudentCohort.create(student: student_2, cohort: cohort_1)
      instructor.update(cohorts: [cohort_1])
      login_as(instructor, :scope => :user)
      visit user_cohorts_path(instructor)
      expect(page.body).to have_link("Create Cohort")
    end
  end

  describe "New Cohort Features" do
    it "can create a new cohort for an instructor" do
      login_as(instructor, scope: :user)
      visit new_user_cohort_path(instructor)
      fill_in "cohort_name", with: "Alpha Beta"
      click_button "Create Cohort"
      expect(page.body).to have_content("Alpha Beta")
    end
  end
end