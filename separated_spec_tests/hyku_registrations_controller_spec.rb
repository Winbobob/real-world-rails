RSpec.describe Hyku::RegistrationsController, type: :controller do
  before do
    allow(Settings.devise).to receive(:account_signup).and_return(account_signup_enabled)
    # Recommended by Devise: https://github.com/plataformatec/devise/wiki/How-To:-Test-controllers-with-Rails-3-and-4-%28and-RSpec%29
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  context 'with account signup enabled' do
    let(:account_signup_enabled) { true }

    describe '#new' do
      it 'renders the form' 

    end
    describe '#create' do
      it 'processes the form' 

    end
  end
  context 'with account signup disabled' do
    let(:account_signup_enabled) { false }

    describe '#new' do
      it 'redirects with a flash message' 

    end
    describe '#create' do
      it 'redirects with a flash message' 

    end
  end
end

