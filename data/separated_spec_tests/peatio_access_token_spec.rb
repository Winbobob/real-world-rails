require 'spec_helper'

describe Doorkeeper::AccessToken do

  let(:app) { Doorkeeper::Application.create!(name: 'test', uid: 'foo', secret: 'bar', redirect_uri: 'http://test.host/oauth/callback') }
  let(:member) { create(:member) }

  subject! { Doorkeeper::AccessToken.create!(application_id: app.id, resource_owner_id: member.id, scopes: 'identity', expires_in: 1.week) }

  context "creation" do
    it "should generate corresponding api token" 


    it "should prevent app requesting all scopes" 


    it "should set token" 


    it "should setup api token correctly" 


    it "should link api token" 

  end

  context "revoke" do
    it "should revoke access token and destroy corresponding api token" 

  end

  context "deletion" do
    it "should soft delete record" 

  end

end

