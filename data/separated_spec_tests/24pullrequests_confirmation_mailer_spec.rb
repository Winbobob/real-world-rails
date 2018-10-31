require 'rails_helper'

describe ConfirmationMailer, type: :mailer do
  describe 'confirmation' do
    let(:token) { 'abcdefg12345' }
    let(:user) do
      mock_model(User, nickname:           'David',
                       email:              'david@example.com',
                       confirmation_token: token)
    end
    let(:mail) { ConfirmationMailer.confirmation(user) }

    it 'renders the subject' 


    it 'renders the receiver email' 


    it 'renders the sender email' 


    it 'uses nickname' 


    it 'includes the confirmation token' 

  end
end

