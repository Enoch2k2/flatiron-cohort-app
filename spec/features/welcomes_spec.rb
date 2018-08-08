require 'rails_helper'

RSpec.feature "Welcomes", type: :feature do
  describe "homepage" do

    before(:each) do
      visit root_path
    end

    it "returns a status code of 200" do
      expect(page.status_code).to eq(200)
    end
  end
end
