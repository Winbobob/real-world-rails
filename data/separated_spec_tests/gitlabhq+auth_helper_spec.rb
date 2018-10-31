require "spec_helper"

describe AuthHelper do
  describe "button_based_providers" do
    it 'returns all enabled providers from devise' 


    it 'does not return ldap provider' 


    it 'returns empty array' 

  end

  describe "providers_for_base_controller" do
    it 'returns all enabled providers from devise' 


    it 'excludes ldap providers' 

  end

  describe "form_based_providers" do
    it 'includes LDAP providers' 


    it 'includes crowd provider' 

  end

  describe 'enabled_button_based_providers' do
    before do
      allow(helper).to receive(:auth_providers) { [:twitter, :github] }
    end

    context 'all providers are enabled to sign in' do
      it 'returns all the enabled providers from settings' 

    end

    context 'GitHub OAuth sign in is disabled from application setting' do
      it "doesn't return github as provider" 

    end
  end

  describe 'button_based_providers_enabled?' do
    before do
      allow(helper).to receive(:auth_providers) { [:twitter, :github] }
    end

    context 'button based providers enabled' do
      it 'returns true' 

    end

    context 'all the button based providers are disabled via application_setting' do
      it 'returns false' 

    end
  end

  describe 'unlink_allowed?' do
    [:saml, :cas3].each do |provider|
      it "returns true if the provider is #{provider}" 

    end

    [:twitter, :facebook, :google_oauth2, :gitlab, :github, :bitbucket, :crowd, :auth0, :authentiq].each do |provider|
      it "returns false if the provider is #{provider}" 

    end
  end
end

