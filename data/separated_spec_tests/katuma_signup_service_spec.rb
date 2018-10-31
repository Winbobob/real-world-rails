require 'rails_helper'

describe Account::SignupService do
  describe '#create!' do
    subject { described_class.new.create!(email) }

    let(:email) { 'foo@bar.com' }

    before do
      allow(Account::SignupJob).to receive(:perform_later).with(kind_of(Integer))
    end

    context 'when there is a signup with the email' do
      let!(:signup) { FactoryGirl.create(:signup, email: email) }
      it { is_expected.to eq(signup) }
    end

    context 'when there is no signup with the email' do
      let(:signup) { FactoryGirl.build(:signup, email: email) }

      before do
        allow(Account::Signup)
          .to receive(:find_or_initialize_by).with(email: email)
          .and_return(signup)
      end

      it { is_expected.to eq(signup) }

      it 'sends the confirmation email async' 

    end
  end

  describe '#complete!' do
    subject { described_class.new.complete!(signup, options) }

    let!(:signup) { FactoryGirl.create(:signup) }

    before do
      allow(Account::User)
        .to receive(:new)
        .with({ email: signup.email }.merge(options))
        .and_return(user)
    end

    context 'when the user cannot be created' do
      let(:user) { FactoryGirl.build(:user) }
      let(:options) do
        {
          username: nil,
          password: nil,
          password_confirmation: nil,
          first_name: nil,
          last_name: nil
        }
      end

      before { allow(user).to receive(:save).and_return(false) }

      it 'does not persist the user' 


      it 'does not remove the signup' 


      it { is_expected.to eq(user) }
    end

    context 'when the user can be created' do
      let(:user) { FactoryGirl.build(:user) }
      let(:options) do
        {
          username: 'pep23',
          password: 'crypted_password',
          password_confirmation: 'crypted_password',
          first_name: 'pep',
          last_name: 'palau'
        }
      end

      before { allow(user).to receive(:save).and_return(true) }

      it 'persists the user' 


      it 'removes te signup' 


      it { is_expected.to eq(user) }
    end
  end
end

