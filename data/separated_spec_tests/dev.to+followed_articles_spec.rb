require "rails_helper"

RSpec.describe "FollowedArticles", type: :request do
  describe "GET followed articles index" do
    let(:user) { create(:user) }

    before do
      login_as user
    end

    it "returns empty articles array if not following anyone" 


    it "returns articles of tag I follow" 

  end
end

