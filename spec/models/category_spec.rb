require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:image_url) }
  end

  describe "associations" do
    it { should have_many(:meals) }
  end
end
