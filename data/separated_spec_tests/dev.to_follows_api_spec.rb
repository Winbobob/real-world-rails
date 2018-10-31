require "rails_helper"

RSpec.describe "FollowsApi", type: :request do
  describe "POST /api/follows" do
    let(:user) { create(:user) }
    let(:user2) { create(:user) }
    let(:user3) { create(:user) }
    let(:user4) { create(:user) }
    let(:user5) { create(:user) }
    let(:users_hash) do
      [{ id: user2.id }, { id: user3.id }, { id: user4.id }, { id: user5.id }].to_json
    end

    it "returns empty if user not signed in" 


    it "makes successful ping" 

  end
end

