require "rails_helper"

RSpec.describe MovieActor, type: :model do
  describe "relationships" do
    it { should belong_to :movie }
    it { should belong_to :actor }
  end

  describe "validations" do
    it { should validate_presence_of(:movie_id) }
    it { should validate_presence_of(:actor_id) }
  end
end
