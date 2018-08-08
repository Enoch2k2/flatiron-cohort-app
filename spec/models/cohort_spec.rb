require 'rails_helper'

RSpec.describe Cohort, type: :model do
  let(:cohort){ create(:cohort) }
  
  describe "attributes" do
    it "has a name" do
      expect(cohort.name).to eq("Cohort 1")
    end
  end

  describe "associations" do
    it {should belongs_to(:instructor)}

    it "has many students, through student_cohorts"
  end
end
