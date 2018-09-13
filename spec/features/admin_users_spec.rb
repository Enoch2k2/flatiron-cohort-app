require 'rails_helper'

RSpec.feature "Admin Users", type: :feature do
  describe "Index Page" do 
    it "does not allow non-admins to view" do 
      instructor_login 
      visit admin_users_path
      expect(current_path).to eq('/')
      expect(page).to have_content("You are not authorized to perform this action.")
    end
  end
end