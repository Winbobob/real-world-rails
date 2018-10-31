require 'rails_helper'

RSpec.describe Devise::Mailer, type: :mailer do
  describe '#confirmation_instructions' do

    let(:email) { 'foo@bar.com' }
    let(:user) { build_stubbed(:user, email: email, name: 'Marco Polo') }
    let(:token) { 't6yLBzYEURpd7LQKqsVu' }
    let(:mail) { described_class.confirmation_instructions(user, token) }

    describe 'renders the headers' do
      it { expect(mail.subject).to eq('Please confirm your Help with Fees staff email') }
      it { expect(mail.to).to eq([email]) }
      it { expect(mail.from).to eq(['no-reply@helpwithcourtfees.service.gov.uk']) }
    end

    it 'renders the body' 


    it 'renders the confirmation link' 

  end
end

