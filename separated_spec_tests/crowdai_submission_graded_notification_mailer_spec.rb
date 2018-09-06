require 'spec_helper'

RSpec.describe SubmissionGradedNotificationMailer, type: :mailer do

  describe 'methods' do
    let(:challenge) { create :challenge }
    let(:participant) { create :participant }
    let!(:email_preference) { create :email_preference, :every_email, participant: participant }
    let(:submission) { create :submission, challenge: challenge, participant: participant }

    it 'successfully sends a message' 


    it 'addresses the email to the participant' 


    it 'produces a body which is correct HTML' 


    it 'produces a valid unsubscribe link' 

  end

end

