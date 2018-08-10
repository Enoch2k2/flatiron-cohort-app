require 'rails_helper'

RSpec.feature "Welcomes", type: :feature do
  let(:student_role){create(:student_role)}
  let(:instructor_role){create(:instructor_role)}
  let(:admin_role){create(:admin_role)}
  let(:student){create(:student_1, roles: [student_role])}
  let(:instructor){create(:instructor, roles: [instructor_role, admin_role])}
  describe "homepage" do

    it "returns a status code of 200" do
      visit root_path
      expect(page.status_code).to eq(200)
    end
  end

  describe "logging in as a student" do
    it "has a drop down for student" do
      login_as(student, :scope => :user)
      visit root_path
      expect(page.body).to have_css("a#student-dropdown")
    end

    it "should not have a drop down for Admin and Instructor" do
      login_as(student, :scope => :user)
      visit root_path
      expect(page.body).to_not have_css("a#admin-dropdown")
      expect(page.body).to_not have_css("a#instructor-dropdown")
    end
  end

  describe "logging in as an instructor" do
    it "has a drop down for Admin and Instructor" do
      login_as(instructor, :scope => :user)
      visit root_path
      expect(page.body).to have_css("a#admin-dropdown")
      expect(page.body).to have_css("a#instructor-dropdown")
    end

    it "should not have a drop down for Student" do
      login_as(instructor, :scope => :user)
      visit root_path

      expect(page.body).to_not have_css("a#student-dropdown")
    end
  end
end
