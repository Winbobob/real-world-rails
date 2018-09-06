require 'rails_helper'

RSpec.describe PublicMailer, type: :mailer do
  describe '#submission_confirmation' do

    let(:email) { 'foo@bar.com' }
    let(:mail_data) { create(:online_application, :with_reference, :with_email) }
    let(:mail) { described_class.submission_confirmation(mail_data) }

    describe 'renders the headers' do
      it { expect(mail.subject).to eq(I18n.t('email.confirmation.subject')) }
      it { expect(mail.to).to eq([email]) }
      it { expect(mail.from).to eq(['no-reply@helpwithcourtfees.service.gov.uk']) }
    end

    it 'renders the body' 

  end

  describe '#refund_confirmation' do

    let(:email) { 'foo@bar.com' }
    let(:mail_data) { create(:online_application, :with_reference, :with_email) }
    let(:mail) { described_class.submission_confirmation_refund(mail_data) }

    describe 'renders the headers' do
      it { expect(mail.subject).to eq(I18n.t('email.refund.subject')) }
      it { expect(mail.to).to eq([email]) }
      it { expect(mail.from).to eq(['no-reply@helpwithcourtfees.service.gov.uk']) }
    end

    it 'renders the body' 

  end

  describe '#et_confirmation' do

    let(:email) { 'foo@bar.com' }
    let(:mail_data) { create(:online_application, :et, :with_reference, :with_email) }
    let(:mail) { described_class.submission_confirmation_et(mail_data) }

    describe 'renders the headers' do
      it { expect(mail.subject).to eq(I18n.t('email.et.subject')) }
      it { expect(mail.to).to eq([email]) }
      it { expect(mail.from).to eq(['no-reply@helpwithcourtfees.service.gov.uk']) }
    end

    it 'renders the body' 

  end
end

