require "spec_helper"

describe QuestionAnsweredNotifierWorker do
  describe '#perform' do
    before { ActionMailer::Base.deliveries.clear }

    it "sends emails to question author, staff, and signers" 

  end
end

