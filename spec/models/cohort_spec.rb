require 'rails_helper'

RSpec.describe Cohort, type: :model do
  
  describe "attributes" do
    let(:instructor_role) { create(:instructor_role) }
    let(:instructor){ create(:instructor) }
    let(:user_role) { create(:user_role, user: instructor, role: instructor_role) }
    let(:cohort) {create(:cohort_1, instructor: instructor) }

    it "has a name" do
      expect(cohort.name).to eq("Cohort 1")
    end
  end

  describe "associations" do
    it {should belong_to(:instructor)}
    it {should have_many(:student_cohorts)}
    it {should have_many(:students).through(:student_cohorts) }
  end
end
