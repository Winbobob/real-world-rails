require "spec_helper"

describe UserSetPasswordNoticeWorker do
  describe '#perform' do
    before { ActionMailer::Base.deliveries.clear }

    context "when user is confirmed and has placeholder password" do
      it "sends email asking user to set their password" 

    end

    context "when user is confirmed and has placeholder password, but email_is_disabled" do
      it "it does not send email asking user to set their password" 

    end
  end
end

