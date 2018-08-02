require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(200)
    end

    it "is the root of the website" do
      visit root_path
      expect(page).to have_current_path(root_path)
    end
  end

end
