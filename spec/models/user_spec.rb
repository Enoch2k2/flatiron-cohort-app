require 'rails_helper'

RSpec.describe User, type: :model do
  describe "attributes" do
    it "has a username and password" do
      user = User.create(username: "test", password: "test")

      expect(user.username).to eq("test")
      expect(user.password).to eq("test")
    end
  end
end
