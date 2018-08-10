require 'rails_helper'

RSpec.feature "Users", type: :feature do
  let(:admin_role){create(:admin_role)}
  let(:instructor_role){create(:instructor_role)}
  let(:instructor_without_name){create(:instructor_without_name, roles: [admin_role, instructor_role])}
  describe "Users Features" do
    describe "root path" do
      it "routes to edit page if user doesn't have first and last name" do
        login_as(instructor_without_name, scope: :user)
        visit root_path
        expect(page.body).to include("Edit Account")
      end
    end
  end
end