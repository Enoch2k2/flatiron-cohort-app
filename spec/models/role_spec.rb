require 'rails_helper'

RSpec.describe Role, type: :model do
  let(:instructor_role){create(:instructor_role)}
  let(:student_role){create(:student_role)}
  let(:admin_role){create(:admin_role)}

  let(:instructor){create(:instructor, roles: [instructor_role, admin_role])}
  let(:student){create(:student_1, roles: [student_role])}


  describe "attributes" do
    it "has a name" do
      expect(instructor_role.name).to eq("Instructor")
      expect(student_role.name).to eq("Student")
      expect(admin_role.name).to eq("Admin")
    end
  end

  describe "associations" do
    it { should have_many(:user_roles) }
    it { should have_many(:users).through(:user_roles) }
  end
end
