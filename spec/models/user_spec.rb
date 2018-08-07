require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user){User.create(email: "test@test.com", password: "testtest")}

  describe "attributes" do
    it "has a first_name" do
      user.update(first_name: "Test")

      expect(user.first_name).to eq("Test")
      expect(user.valid?).to eq(true)
    end

    it "has a last_name" do
      user.update(last_name: "Test")

      expect(user.last_name).to eq("Test")
      expect(user.valid?).to eq(true)
    end

    it "has a slack_username" do
      user.update(slack_username: "Test2k2")
      
      expect(user.slack_username).to eq("Test2k2")
      expect(user.valid?).to eq(true)
    end

    it "has a current lesson" do
      user.update(current_lesson: "Intro to HTML")

      expect(user.current_lesson).to eq("Intro to HTML")
      expect(user.valid?).to eq(true)
    end

    it "keeps track of completed lessons" do
      user.update(completed_lessons: user.completed_lessons + 15)

      expect(user.completed_lessons).to eq(15)
      expect(user.valid?).to eq(true)
    end
  end

  describe "associations" do
    it "has many cohorts"

    it "has many roles"
  end
end
