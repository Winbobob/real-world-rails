require 'rails_helper'

RSpec.describe DeviseMailer, type: :mailer do
  before do
    allow(Settings.govuk_notify.templates).to receive(:new_user).and_return('11111111-0000-0000-0000-111111111111')
    allow(Settings.govuk_notify.templates).to receive(:new_external_admin).and_return('22222222-0000-0000-0000-222222222222')
    allow(Settings.govuk_notify.templates).to receive(:new_external_advocate_admin).and_return('33333333-0000-0000-0000-333333333333')
    allow(Settings.govuk_notify.templates).to receive(:new_external_litigator_admin).and_return('44444444-0000-0000-0000-444444444444')
    allow(Settings.govuk_notify.templates).to receive(:password_reset).and_return('55555555-0000-0000-0000-555555555555')
    allow(Settings.govuk_notify.templates).to receive(:unlock_instructions).and_return('66666666-0000-0000-0000-666666666666')
  end

  describe 'reset_password_instructions' do
    subject(:mail) { described_class.reset_password_instructions(external_user.user, 'fake_token', inviting_user.name) }

    let(:external_user) { create(:external_user, supplier_number: 'XX878', user: create(:user, last_name: 'Smith', first_name: 'John', email:'test@example.com')) }
    let(:inviting_user) { create(:external_user) }

    it 'is a govuk_notify delivery' 


    it 'sets the recipient' 


    it 'sets the personalisation' 


    context 'when user is not new' do
      let(:external_user) { create(:external_user, user: create(:user, sign_in_count: 1)) }

      it 'sets the template' 

    end

    context 'when user is new' do
      let(:external_user) { create(:external_user) }

      it 'sets the template' 

    end

    context 'when user is only an admin' do
      let(:external_user) { create(:external_user, :admin) }

      it 'sets the template' 

    end

    context 'when user is a new advocate admin' do
      let(:external_user) { create(:external_user, :advocate_and_admin) }

      it 'sets the template' 

    end

    context 'when user is a new litigator admin' do
      let(:external_user) { create(:external_user, :litigator_and_admin) }

      it 'sets the template' 

    end
  end

  describe 'unlock_instructions' do
    subject(:mail) { described_class.unlock_instructions(external_user.user, 'fake_token') }

    let(:external_user) { create(:external_user, supplier_number: 'XX878', user: create(:user, last_name: 'Smith', first_name: 'John', email:'test@example.com')) }

    it 'is a govuk_notify delivery' 


    it 'sets the recipient' 


    it 'sets the personalisation' 

  end
end
