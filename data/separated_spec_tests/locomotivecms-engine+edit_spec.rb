describe 'locomotive/my_account/edit', type: :view do

  helper(Locomotive::BaseHelper, Locomotive::Shared::AccountsHelper, Locomotive::MyAccountHelper, Locomotive::Engine.routes.url_helpers)
  helper(Locomotive::TestViewHelpers)

  let(:account) { build(:account, api_key: 42) }

  before {
    allow(view).to receive(:last_saved_location).and_return(nil)
    allow(view).to receive(:current_locomotive_account).and_return(account)
  }

  before do
    assign(:account, account)
  end

  subject { render }

  describe 'api_key input' do

    it 'renders the url to generate a new API key' 


  end

  describe 'file input' do

    it 'renders a label for a new file' 


  end

  describe 'i18n' do

    it 'renders a localized label' 


    it 'renders a localized hint' 


  end

   describe 'new password' do

    it 'renders an input for the current password' 


    it 'renders an input for a new password' 


    it 'renders an input for a new password confirmation' 


  end


end

