require 'spec_helper'
RSpec.describe Admin::ChallengeCallResponseNotificationMailer, type: :mailer, api: true do

  describe 'methods' do
    let(:participant) { create :participant, :admin }
    let!(:email_preference) { create :email_preference, :every_email, participant: participant }
    let(:challenge_call_response) { create :challenge_call_response }

    it 'successfully sends a message' 


    it 'addresses the email to the participant' 


    it 'produces a body which is correct HTML' 


    it 'produces a valid unsubscribe link' 

  end

end

