require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe '#send_welcome_email_to' do
    subject(:welcome_email) { UserMailer.send_welcome_email_to(user) }

    let(:user) { FactoryBot.create(:user, email: 'kevin@example.com') }


    it 'renders the correct sender address' 


    it 'includes an attachment' 


    it 'renders the correct attachment' 


    it 'renders the correct subject' 


    it 'sends the email to the correct address' 


  end
end

