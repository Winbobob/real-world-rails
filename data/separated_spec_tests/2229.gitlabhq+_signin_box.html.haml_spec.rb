require 'rails_helper'

describe 'devise/shared/_signin_box' do
  describe 'Crowd form' do
    before do
      stub_devise
      assign(:ldap_servers, [])
      allow(view).to receive(:current_application_settings).and_return(Gitlab::CurrentSettings.current_application_settings)
      allow(view).to receive(:captcha_enabled?).and_return(false)
    end

    it 'is shown when Crowd is enabled' 


    it 'is not shown when Crowd is disabled' 

  end

  def stub_devise
    allow(view).to receive(:devise_mapping).and_return(Devise.mappings[:user])
    allow(view).to receive(:resource).and_return(spy)
    allow(view).to receive(:resource_name).and_return(:user)
  end

  def enable_crowd
    allow(view).to receive(:form_based_providers).and_return([:crowd])
    allow(view).to receive(:crowd_enabled?).and_return(true)
    allow(view).to receive(:omniauth_authorize_path).with(:user, :crowd)
      .and_return('/crowd')
  end
end
