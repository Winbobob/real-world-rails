require 'spec_helper'
RSpec.describe Organizer::EuaNotificationMailer, type: :mailer, api: true do

  describe 'methods' do
    let!(:organizer_participant) { create :participant, organizer: organizer }
    let!(:organizer) { create :organizer, :clef }
    let!(:participant) { create :participant }
    let!(:clef_task) { create :clef_task }
    let!(:challenge) { create :challenge, clef_task: clef_task }
    let!(:email_preference) { create :email_preference, :every_email, participant: organizer_participant }

    it 'successfully sends a message' 


    it 'addresses the email to the participant' 


    it 'produces a body which is correct HTML' 


    it 'produces a valid unsubscribe link' 

  end

end

