require 'spec_helper'

describe GoogleUserBuilder do
  let(:sample_data) {
    {
      uid: 'google123',
      info: {
        first_name: 'Jan',
        last_name: 'Kowalski',
        email: 'jan@kowalski.pl'
      },
      extra: { raw_info: { hd: 'example.com' }},
      credentials: {
        oauth_token: 123,
        refresh_token: 456,
        oauth_expires_at: Time.now+1.hour
      }
    }
  }

  subject { described_class.new(sample_data) }

  describe '#call' do
    context 'when user already exists' do
      let!(:user) { create(:user, email: 'jan@kowalski.pl') }

      it 'do not creates new user' 


      it 'updates user' 

    end

    context 'when user does not exists' do
      before do
        allow(
          CreateRatesForUserJob
        ).to receive(:perform_async).and_return(true)
      end

      it 'creates new user' 


      it 'generates base user_skill_rates' 

    end
  end
end

