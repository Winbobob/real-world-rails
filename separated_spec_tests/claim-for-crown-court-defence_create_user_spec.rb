require 'rails_helper'

RSpec.describe ExternalUsers::CreateUser do
  let(:user) { create(:user) }

  subject(:service) { described_class.new(user) }

  describe '#call!' do
    it 'creates a provider with new unique LGFS and firm AGFS supplier numbers' 


    it 'creates an external user related with the provided user and the created provider' 


    context 'when the provider is not created due to some error' do
      before do
        expect(Provider)
          .to receive(:create!)
          .with(any_args)
          .and_raise(StandardError, 'BOOM!!!')
      end

      it 'does not create an external user related with the provided user' 

    end
  end
end

