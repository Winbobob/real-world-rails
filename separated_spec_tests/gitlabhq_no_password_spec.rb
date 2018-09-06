require 'spec_helper'

feature 'No Password Alert' do
  let(:project) { create(:project, :repository, namespace: user.namespace) }

  context 'with internal auth enabled' do
    before do
      sign_in(user)
      visit project_path(project)
    end

    context 'when user has a password' do
      let(:user) { create(:user) }

      it 'shows no alert' 

    end

    context 'when user has password automatically set' do
      let(:user) { create(:user, password_automatically_set: true) }

      it 'shows a password alert' 

    end
  end

  context 'with internal auth disabled' do
    let(:user) { create(:omniauth_user, extern_uid: 'my-uid', provider: 'saml') }

    before do
      stub_application_setting(password_authentication_enabled_for_git?: false)
      stub_omniauth_saml_config(enabled: true, auto_link_saml_user: true, allow_single_sign_on: ['saml'], providers: [mock_saml_config])
    end

    context 'when user has no personal access tokens' do
      it 'has a personal access token alert' 

    end

    context 'when user has a personal access token' do
      it 'shows no alert' 

    end
  end

  context 'when user is ldap user' do
    let(:user) { create(:omniauth_user, password_automatically_set: true) }

    before do
      sign_in(user)
      visit project_path(project)
    end

    it 'shows no alert' 

  end
end

