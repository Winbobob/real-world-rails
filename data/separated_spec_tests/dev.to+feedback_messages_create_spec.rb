require "rails_helper"

RSpec.describe "feedback_messages", type: :request do
  describe "POST /feedback_messages" do
    # rubocop:disable RSpec/AnyInstance
    before do
      allow_any_instance_of(FeedbackMessagesController).
        to receive(:recaptcha_verified?).and_return(true)
      allow(SlackBot).to receive(:ping).and_return(true)
    end
    # rubocop:enable RSpec/AnyInstance

    valid_abuse_report_params = {
      feedback_message: {
        feedback_type: "abuse-reports",
        category: "rude or vulgar",
        reported_url: "https://dev.to",
        message: "this was vulgar"
      }
    }

    context "with valid params" do
      before do
        post "/feedback_messages", params: valid_abuse_report_params
      end

      it "creates feedback message with filled form" 


      it "send a Slack message when completed" 

    end

    context "when a logged in user submits a report" do
      let(:user) { create(:user) }

      before do
        login_as(user)
        post "/feedback_messages", params: valid_abuse_report_params
      end

      it "adds the logged in user as the reporter" 


      it "send a Slack message when completed" 

    end

    context "when a signed out users submits a report" do
      before { post "/feedback_messages", params: valid_abuse_report_params }

      it "does not add any user as the reporter" 


      it "send a Slack message when completed" 

    end
  end
end

