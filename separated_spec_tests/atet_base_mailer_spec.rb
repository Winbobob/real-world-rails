# coding: utf-8
require "rails_helper"

describe BaseMailer, type: :mailer do
  include ClaimsHelper
  include Messages
  include MailMatchers

  def table_heading(heading)
    I18n.t("base_mailer.confirmation_email.details.#{heading}")
  end

  include_context 'block pdf generation'

  let(:claim) { create(:claim, :with_pdf, email_address: email_address) }
  let(:email_address) { 'mail@example.com' }
  let(:email) { subject.deliver_now }

  describe '#access_details_email' do
    subject { described_class.access_details_email(claim) }

    it 'has been delivered' 


    it 'has a recipient' 


    it "has a subject" 


    it 'has reference in body' 

  end

  describe '#confirmation_email' do
    subject { described_class.confirmation_email(claim) }

    let(:email_addresses) { ['bill@example.com', 'mike@example.com'] }
    let(:attachment) { email.parts.find(&:filename) }

    before do
      claim.confirmation_email_recipients = email_addresses
      allow(claim).to receive(:payment_applicable?).and_return false
      allow(claim).to receive(:remission_applicable?).and_return false
    end

    context "post delivery" do
      it 'has been delivered' 


      it "has a subject" 


      it 'has recipients' 


      it 'has reference in the body' 


      it 'has office' 


      it 'has an attachment' 


      context 'when no office' do
        before { claim.office = nil }

        it 'does not show office details' 

      end

      context 'when paid' do
        before do
          allow(claim).to receive(:fee_to_pay?).and_return(true)
        end

        describe 'hide paid message' do
          it { expect(email).to match_pattern('Thank you for submitting') }
          it { expect(email).not_to match_pattern('Issue fee paid:') }
        end

        it 'hide amount paid' 

      end

      context 'when payment is skipped' do
        let(:fee_calculation) do
          instance_double(ClaimFeeCalculator::Calculation, application_fee: 100, fee_to_pay?: true)
        end

        before do
          claim.payment = nil

          allow(claim).to receive(:payment_applicable?).and_return false
          allow(claim).to receive(:fee_calculation).and_return fee_calculation
        end

        it 'shows the intro for payment failure' 


        it 'explains payment was unsuccessful' 


        it 'does not show outstanding fee' 

      end
    end
  end
end

