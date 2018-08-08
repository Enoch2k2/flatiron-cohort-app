require 'rails_helper'

RSpec.describe User, type: :model do
    let(:student){create(:user)}
  describe "attributes" do
    it "has a first_name" do
      student.update(first_name: "Test")

      expect(student.first_name).to eq("Test")
      expect(student.valid?).to eq(true)
    end

    it "has a last_name" do
      student.update(last_name: "Test")

      expect(student.last_name).to eq("Test")
      expect(student.valid?).to eq(true)
    end

    it "has a slack_username" do
      student.update(slack_username: "Test2k2")
      
      expect(student.slack_username).to eq("Test2k2")
      expect(student.valid?).to eq(true)
    end

    it "has a current lesson" do
      student.update(current_lesson: "Intro to HTML")

      expect(student.current_lesson).to eq("Intro to HTML")
      expect(student.valid?).to eq(true)
    end

    it "keeps track of completed lessons" do
      student.update(completed_lessons: student.completed_lessons + 15)

      expect(student.completed_lessons).to eq(15)
      expect(student.valid?).to eq(true)
    end
  end

  describe "associations" do
    it "has many cohorts"

    it "has many roles"
  end
end
