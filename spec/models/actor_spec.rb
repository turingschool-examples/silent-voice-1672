require "rails_helper"

RSpec.describe Actor, type: :model do
  describe "relationships" do
    it { should have_many :movies }
    it { should have_many :movie_actors }
    it { should have_many :studios }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
  end
end
