# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/data_cycle/survey_update"

describe SurveyUpdate do
  describe '#initialize' do
    it 'creates notifications, sends emails, and sends follow-ups' 

  end

  context 'when there are active surveys' do
    include_context 'survey_assignment'
    before do
      described_class.new
    end

    it "sends emails for all SurveyNotifications with emails that haven\'t been sent" 


    it 'sends emails to the users email address' 


    it 'sets SurveyNotification email_sent datetime attribute after sending' 


    it "only sends emails for notifications which haven't been dismissed" 


    # This doesn't really test the effects of the error handling, but it does exercise it.
    it 're-raises common SMTP errors if they recur' 

  end
end

