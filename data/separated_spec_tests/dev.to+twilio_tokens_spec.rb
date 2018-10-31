require "rails_helper"

RSpec.describe "TwilioTokens", type: :request do
  let(:user) { create(:user) }
  let(:chat_channel) { create(:chat_channel) }

  before do
    sign_in user
  end

  describe "GET /twilio_tokens/:id" do
    it "returns a token for member of a channel" 


    it "returns not found if unknown ID" 


    it "returns not found if wrong ID prefix" 


    # it "returns unauthorized if user not member of channel" do
    #   expect { get "/twilio_tokens/private-video-channel-#{chat_channel.id}" }.
    #     to raise_error(Pundit::NotAuthorizedError)
    # end
  end
end

