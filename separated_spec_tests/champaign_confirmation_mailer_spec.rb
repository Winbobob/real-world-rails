# frozen_string_literal: true
require 'rails_helper'

describe ConfirmationMailer do
  describe 'confirmation_email' do
    let(:mail) { ConfirmationMailer.confirmation_email(email: 'test@example.com', token: '123', language: 'EN') }

    it 'renders the headers' 


    describe 'HTML body' do
      subject { mail.html_part.body.to_s }

      it 'has a thank you message' 


      it 'has confirmation link' 

    end

    describe 'Plain text body' do
      subject { mail.text_part.body.to_s }

      it 'has a thank you message' 


      it 'has confirmation link' 

    end
  end
end

