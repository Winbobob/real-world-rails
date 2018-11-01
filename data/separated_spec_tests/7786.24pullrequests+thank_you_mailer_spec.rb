require 'rails_helper'

describe ThankYouMailer, type: :mailer do
  describe 'thank_you' do
    let(:token) { 'abcdefg12345' }
    let(:user) do
      mock_model(User, nickname:            'David',
                       email:               'david@example.com',
                       pull_requests_count: 24,
                       confirmation_token:  token)
    end
    let(:mail) { ThankYouMailer.thank_you(user) }

    it 'renders the subject' 


    it 'renders the receiver email' 


    it 'renders the sender email' 


    it 'uses nickname' 

  end
end

