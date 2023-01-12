require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:email) }
    it {should validate_presence_of(:username) }
    it {should validate_presence_of(:password) }
    it {should validate_uniqueness_of(:username) }
    it {should validate_uniqueness_of(:email) }
  end

  describe "associations" do
    it { should have_many(:orders) }
  end

  describe "#role?" do
    let(:user) { User.create(email: 'user@example.com', username: 'user', password: 'password', role: 'customer') }

    it "returns true if the user is a customer" do
      expect(user.role?(:customer)).to be true
    end

    it "returns false if the user is not a customer" do
      expect(user.role?(:admin)).to be false
    end
  end

end
