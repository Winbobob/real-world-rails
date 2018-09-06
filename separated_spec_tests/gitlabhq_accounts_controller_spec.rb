require 'spec_helper'

describe Profiles::AccountsController do
  describe 'DELETE unlink' do
    let(:user) { create(:omniauth_user) }

    before do
      sign_in(user)
    end

    it 'renders 404 if someone tries to unlink a non existent provider' 


    [:saml, :cas3].each do |provider|
      describe "#{provider} provider" do
        let(:user) { create(:omniauth_user, provider: provider.to_s) }

        it "does not allow to unlink connected account" 

      end
    end

    [:twitter, :facebook, :google_oauth2, :gitlab, :github, :bitbucket, :crowd, :auth0, :authentiq].each do |provider|
      describe "#{provider} provider" do
        let(:user) { create(:omniauth_user, provider: provider.to_s) }

        it 'allows to unlink connected account' 

      end
    end
  end
end

