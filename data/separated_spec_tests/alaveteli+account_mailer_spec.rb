# -*- encoding : utf-8 -*-
require 'spec_helper'

describe AlaveteliPro::AccountMailer do

  describe '#account_request' do
    let(:account_request) do
      AlaveteliPro::AccountRequest.new(email: 'test@localhost',
                                       reason: 'Have a look around',
                                       marketing_emails: 'no',
                                       training_emails: 'yes',
                                       offer_code: 'SPECIAL')
    end

      before do
        @message = AlaveteliPro::AccountMailer.
                     account_request(account_request).
                       message
      end

    it "sends the email to the pro contact address" 


    it 'sends the email from the blackhole email address' 


    it 'has a subject including "account request"' 


    it 'includes the email address' 


    it 'includes the reason' 


    it 'includes the offer code' 


    it 'includes the marketing emails opt-in' 


    it 'includes the training emails opt-in' 

  end

end

