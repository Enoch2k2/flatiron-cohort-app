require 'rails_helper'

RSpec.describe Role, type: :model do
  let(:instructor_role){create(:instructor_role)}
  let(:student_role){create(:student_role)}
  let(:admin_role){create(:admin_role)}

  let(:instructor){create(:user)}
  let(:student){create(:user)}

  describe "attributes" do
    it "has a name" do

    end
  end

  describe "associations" do
    it "has many users, through user_roles"
  end
end
