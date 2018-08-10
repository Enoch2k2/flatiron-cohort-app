require 'rails_helper'

RSpec.describe User, type: :model do
    let(:student_role){create(:student_role)}
    let(:student){create(:student_1, roles: [student_role])}
    let(:admin_role){create(:admin_role)}
    let(:instructor_role){create(:instructor_role)}
    let(:instructor){create(:instructor, roles: [admin_role, instructor_role])}
  describe "attributes" do
    it "has a first_name" do
      expect(student.first_name).to eq("Test")
      expect(student.valid?).to eq(true)
    end

    it "has a last_name" do
      expect(student.last_name).to eq("Test")
      expect(student.valid?).to eq(true)
    end

    it "has a slack_username" do
      
      expect(student.slack_username).to eq("Test2k2")
      expect(student.valid?).to eq(true)
    end

    it "has a current lesson" do
      expect(student.current_lesson).to eq("Intro to HTML")
      expect(student.valid?).to eq(true)
    end

    it "keeps track of completed lessons" do
      expect(student.completed_lessons).to eq(15)
      expect(student.valid?).to eq(true)
    end
  end

  describe "authorizations" do
    it "#admin? should return true if you have a role of admin" do
      expect(instructor.admin?).to eq(true)
    end

    it "#instructor? should return true if you have a role of instructor" do
      expect(instructor.instructor?).to eq(true)
    end

    it "#student? should return true if you hae a role of a student" do
      expect(student.student?).to eq(true)
    end
  end

  describe "helpers" do
    it "#full_name displays the first and last name of the user" do
      expect(instructor.full_name).to eq("Bob Not Bob")
    end
  end

  describe "associations" do
    it { should have_many(:student_cohorts) }

    it { should have_many(:cohorts).through(:student_cohorts) }
  end
end
