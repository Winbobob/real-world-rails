require "rails_helper"

RSpec.describe "PusherAuth", type: :request do
  let(:user) { build(:user) }
  let(:chat_channel) { build(:chat_channel) }

  describe "POST /pusher/auth" do
    it "returns forbidden with invalid channel" 


    # it "returns forbidden with invalid channel" do
    #   sign_in user
    #   post "/pusher/auth", params: {
    #     channel_name: "private-message-notifications-#{user.id}"
    #   }
    #   expect(response.body).to include("Forbidden")
    # end
  end
end

