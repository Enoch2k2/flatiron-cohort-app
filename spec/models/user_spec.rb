require 'rails_helper'

RSpec.describe User, type: :model do
    let(:student){create(:student)}
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

  describe "associations" do
    it { should have_many(:student_cohorts) }

    it { should have_many(:cohorts).through(:student_cohorts) }
  end
end
