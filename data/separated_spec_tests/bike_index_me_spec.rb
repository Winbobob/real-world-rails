require 'spec_helper'

describe 'Me API V3' do
  describe 'unauthorized current' do
    it 'Sends correct error code when no user present' 

  end

  describe 'authorized current' do
    before :each do
      create_doorkeeper_app
    end
    context 'fully scoped token' do
      before { @token.update_attribute :scopes, OAUTH_SCOPES_S }
      it 'responds with all available attributes with full scoped token' 

    end

    context 'no bikes scoped' do
      let(:token) { Doorkeeper::AccessToken.create!(application_id: @application.id, resource_owner_id: @user.id) }
      it "doesn't include bikes" 

    end

    context 'no membership scoped' do
      let(:token) { Doorkeeper::AccessToken.create!(application_id: @application.id, resource_owner_id: @user.id) }
      it "doesn't include memberships if no memberships scoped" 

    end

    context 'Default scope' do
      it "doesn't include memberships (or is_admin)" 

    end
  end

  describe 'current/bikes' do
    before :each do
      create_doorkeeper_app
    end
    it "works if it's authorized" 

    it "403s if read_bikes_spec isn't in token" 

  end
end

