# frozen_string_literal: true

require 'rails_helper'

describe UserMailer, type: :mailer do
  let(:receiver) { Fabricate(:user) }

  shared_examples 'localized subject' do |*args, **kwrest|
    it 'renders subject localized for the locale of the receiver' 


    it 'renders subject localized for the default locale if the locale of the receiver is unavailable' 

  end

  describe 'confirmation_instructions' do
    let(:mail) { UserMailer.confirmation_instructions(receiver, 'spec') }

    it 'renders confirmation instructions' 


    include_examples 'localized subject',
                     'devise.mailer.confirmation_instructions.subject',
                     instance: Rails.configuration.x.local_domain
  end

  describe 'reconfirmation_instructions' do
    let(:mail) { UserMailer.confirmation_instructions(receiver, 'spec') }

    it 'renders reconfirmation instructions' 

  end

  describe 'reset_password_instructions' do
    let(:mail) { UserMailer.reset_password_instructions(receiver, 'spec') }

    it 'renders reset password instructions' 


    include_examples 'localized subject',
                     'devise.mailer.reset_password_instructions.subject'
  end

  describe 'password_change' do
    let(:mail) { UserMailer.password_change(receiver) }

    it 'renders password change notification' 


    include_examples 'localized subject',
                     'devise.mailer.password_change.subject'
  end

  describe 'email_changed' do
    let(:mail) { UserMailer.email_changed(receiver) }

    it 'renders email change notification' 


    include_examples 'localized subject',
                     'devise.mailer.email_changed.subject'
  end
end

