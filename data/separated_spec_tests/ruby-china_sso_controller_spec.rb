# frozen_string_literal: true

require "rails_helper"

describe Auth::SSOController, type: :controller do
  let(:sso_secret) { "foo(*&@!12q36)" }

  describe "GET /auth/sso/show" do
    before do
      @sso_url = "http://somesite.com/homeland-sso"

      allow(Setting).to receive(:sso).and_return(
        "enable" => true,
        "url"    => @sso_url,
        "secret" => sso_secret
      )
      allow(Setting).to receive(:sso_enabled?).and_return(true)
    end

    it "should work" 


    it "should work with destination_url" 

  end

  describe "GET /auth/sso/login" do
    let(:mock_ip) { "11.22.33.44" }
    before do
      @sso_url = "http://somesite.com/homeland-sso"

      request.host = Setting.domain

      allow(Setting).to receive(:sso).and_return(
        "enable" => true,
        "url"    => @sso_url,
        "secret" => sso_secret
      )
      allow(Setting).to receive(:sso_enabled?).and_return(true)
      allow_any_instance_of(ActionDispatch::Request).to receive(:remote_ip).and_return(mock_ip)
    end

    def get_sso(return_path)
      nonce = SecureRandom.hex
      dso = Homeland::SSO.new
      dso.nonce = nonce
      dso.register_nonce(return_path)

      sso = SingleSignOn.new
      sso.nonce = nonce
      sso.sso_secret = sso_secret
      sso
    end

    it "can take over an account" 


    it "can sign a exist user" 


    it "can take an admin account" 


    it "show error when create failure" 


    it "show error when timeout expried" 

  end

  describe "GET /auth/sso/provider" do
    let(:user) { create(:user) }

    before do
      allow(Setting).to receive(:sso).and_return(
        "secret" => sso_secret
      )
      allow(Setting).to receive(:sso_provider_enabled?).and_return(true)

      @sso = SingleSignOn.new
      @sso.nonce = "mynonce"
      @sso.sso_secret = sso_secret
      @sso.return_sso_url = "http://foobar.com/sso/callback"
    end

    it "should work" 


    it "should work with sign in" 

  end
end

