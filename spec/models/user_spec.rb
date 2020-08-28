require 'rails_helper'

RSpec.describe User, type: :model do
  context "validates a new user" do
    it "sums the number of users" do
      user = User.new
      expect(user.count).to eq 1
    end
  end
end
