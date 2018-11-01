require 'spec_helper'

describe Admin::IdentitiesController do
  let(:admin) { create(:admin) }

  before do
    sign_in(admin)
  end

  describe 'UPDATE identity' do
    let(:user) { create(:omniauth_user, provider: 'ldapmain', extern_uid: 'uid=myuser,ou=people,dc=example,dc=com') }

    it 'repairs ldap blocks' 

  end

  describe 'DELETE identity' do
    let(:user) { create(:omniauth_user, provider: 'ldapmain', extern_uid: 'uid=myuser,ou=people,dc=example,dc=com') }

    it 'repairs ldap blocks' 

  end
end

