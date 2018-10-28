require "rails_helper"

RSpec.describe "/internal/feedback_messages", type: :request do
  describe "PUTS /internal/feedback_messages" do
    context "with a valid request" do
      let(:feedback_message) { create(:feedback_message, :abuse_report) }
      let(:admin)            { create(:user, :super_admin) }

      valid_abuse_report_params = {
        feedback_message: {
          id: 1,
          status: "Resolved",
          note: {
            content: "this is valid",
            reason: "abuse-reports",
          },
        },
      }

      before do
        login_as(admin)
        valid_abuse_report_params[:feedback_message][:reviewer_id] = admin.id
        patch "/internal/feedback_messages/#{feedback_message.id}", params:
          valid_abuse_report_params
      end

      it "adds a note to a report" 


      it "adds the current user as the reviewer" 


      it "updates the last_reviewed_at timestamp" 

    end
  end
end

