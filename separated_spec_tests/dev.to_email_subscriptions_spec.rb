require "rails_helper"

RSpec.describe "EmailSubscriptions", type: :request do
  let(:user) { create(:user) }

  def generate_token(user_id)
    Rails.application.message_verifier(:unsubscribe).generate(
      user_id: user_id,
      email_type: :email_mention_notifications,
      expires_at: Time.now + 31.days,
    )
  end

  describe "GET /email_subscriptions/unsubscribe" do
    it "returns 200 if valid" 


    it "does unsubscribe the user" 


    it "handles error properly" 


    it "won't work if it's past expireation date" 

  end
end

