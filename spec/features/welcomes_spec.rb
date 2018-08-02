require 'rails_helper'

RSpec.feature "Welcomes", type: :feature do
  describe "homepage" do
    it "index is set to root path" do
      visit root_path
      expect(page.body).to include("Flatiron Cohorts")
    end
  end
end
