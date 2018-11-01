require 'rails_helper'

RSpec.describe NotifyMailer, type: :mailer do

  describe 'message_added_email' do
    let(:template) { '4240bf0e-0000-444e-9c30-0d1bb64a2fb4' }

    let(:user) { instance_double(User, name: 'Test Name', email: 'test@example.com') }
    let(:creator) { instance_double(User, name: 'Creator Name', email: 'creator@example.com') }
    let(:external_user) { instance_double(ExternalUser, user: user) }
    let(:creator_user) { instance_double(ExternalUser, user: creator) }
    let(:claim) { instance_double(Claim::BaseClaim, external_user: external_user, creator: creator_user, case_number: 'T201600001') }

    let(:mail) { described_class.message_added_email(claim) }

    before { allow(Settings.govuk_notify.templates).to receive(:message_added_email).and_return(template) }

    it 'is a govuk_notify delivery' 


    it 'sets the recipient' 


    it 'ignores the external user' 


    it 'sets the body' 


    it 'sets the template' 


    it 'sets the personalisation' 

  end
end

