require "rails_helper"

RSpec.describe "Following/Unfollowing", type: :request do
  let(:user) { create(:user) }
  let(:user_2) { create(:user) }

  describe "POST #create" do
    before do
      login_as user
    end

    context "when followable_type is a Tag" do
      let(:tag) { create(:tag) }

      before do
        post "/follows", params: { followable_type: "Tag", followable_id: tag.id }
      end

      it "follows" 


      it "unfollows if already followed" 

    end

    context "when followable_type is a User" do
      before do
        post "/follows", params: {
          followable_type: "User", followable_id: user_2.id
        }
      end

      it "follows" 


      it "unfollows if already followed" 

    end

    context "when followable_type is an Organization" do
      let(:organization) { create(:organization) }

      before do
        post "/follows", params: {
          followable_type: "Organization", followable_id: organization.id
        }
      end

      it "follows" 


      it "unfollows if already followed" 

    end

    it "returns articles of tag the user follows" 

  end
end

