# frozen_string_literal: true

describe Api::OpenidConnect::TokenEndpoint, type: :request do
  let!(:client) { FactoryGirl.create(:o_auth_application_with_ppid) }
  let!(:auth) {
    Api::OpenidConnect::Authorization.find_or_create_by(
      o_auth_application: client, user: bob, redirect_uri: "http://localhost:3000/", scopes: ["openid"])
  }
  let!(:code) { auth.create_code }
  let!(:client_with_specific_id) { FactoryGirl.create(:o_auth_application_with_ppid) }
  let!(:auth_with_specific_id) do
    client_with_specific_id.client_id = "14d692cd53d9c1a9f46fd69e0e57443e"
    client_with_specific_id.jwks = File.read(jwks_file_path)
    client_with_specific_id.save!
    Api::OpenidConnect::Authorization.find_or_create_by(
      o_auth_application: client_with_specific_id,
      user: bob, redirect_uri: "http://localhost:3000/", scopes: ["openid"])
  end
  let!(:code_with_specific_id) { auth_with_specific_id.create_code }

  describe "the authorization code grant type" do
    context "when the authorization code is valid" do
      before do
        post api_openid_connect_access_tokens_path, params: {grant_type: "authorization_code",
             client_id: client.client_id, client_secret: client.client_secret,
             redirect_uri: "http://localhost:3000/", code: code}
      end

      it "should return a valid id token" 


      it "should return an id token with a kid" 


      it "should return a valid access token" 


      it "should not allow code to be reused" 


      it "should not allow a nil code" 

    end

    context "when the authorization code is valid with jwt bearer" do
      before do
        post api_openid_connect_access_tokens_path, params: {grant_type: "authorization_code",
             redirect_uri: "http://localhost:3000/", code: code_with_specific_id,
             client_assertion_type: "urn:ietf:params:oauth:client-assertion-type:jwt-bearer",
             client_assertion: File.read(valid_client_assertion_path)}
      end

      it "should return a valid id token" 


      it "should return a valid access token" 


      it "should not allow code to be reused" 

    end

    context "when the authorization code is not valid" do
      it "should return an invalid grant error" 

    end

    context "when the client assertion is in an invalid format" do
      before do
        post api_openid_connect_access_tokens_path, params: {grant_type: "authorization_code",
             redirect_uri: "http://localhost:3000/", code: code_with_specific_id,
             client_assertion_type: "urn:ietf:params:oauth:client-assertion-type:jwt-bearer",
             client_assertion: "invalid_client_assertion.random"}
      end

      it "should return an error" 

    end

    context "when the client assertion is not matching with jwks keys" do
      before do
        post api_openid_connect_access_tokens_path, params: {grant_type: "authorization_code",
             redirect_uri: "http://localhost:3000/", code: code_with_specific_id,
             client_assertion_type: "urn:ietf:params:oauth:client-assertion-type:jwt-bearer",
             client_assertion: File.read(client_assertion_with_tampered_sig_path)}
      end

      it "should return an error" 

    end

    context "when kid doesn't exist in jwks keys" do
      before do
        post api_openid_connect_access_tokens_path, params: {grant_type: "authorization_code",
             redirect_uri: "http://localhost:3000/", code: code_with_specific_id,
             client_assertion_type: "urn:ietf:params:oauth:client-assertion-type:jwt-bearer",
             client_assertion: File.read(client_assertion_with_nonexistent_kid_path)}
      end

      it "should return an error" 

    end

    context "when the client is unregistered" do
      it "should return an error" 

    end

    context "when the client is unregistered with jwks keys" do
      before do
        post api_openid_connect_access_tokens_path, params: {grant_type: "authorization_code",
             redirect_uri: "http://localhost:3000/", code: code_with_specific_id,
             client_assertion_type: "urn:ietf:params:oauth:client-assertion-type:jwt-bearer",
             client_assertion: File.read(client_assertion_with_nonexistent_client_id_path)}
      end

      it "should return an error" 

    end

    context "when the code field is missing" do
      it "should return an invalid request error" 

    end

    context "when the client_secret doesn't match" do
      it "should return an invalid client error" 

    end
  end

  describe "an unsupported grant type" do
    it "should return an unsupported grant type error" 

  end

  describe "the refresh token grant type" do
    context "when the refresh token is valid" do
      it "should return an access token" 

    end

    context "when the refresh token is not valid" do
      it "should return an invalid grant error" 

    end

    context "when the client is unregistered" do
      it "should return an error" 

    end

    context "when the refresh_token field is missing" do
      it "should return an invalid request error" 

    end

    context "when the client_secret doesn't match" do
      it "should return an invalid client error" 

    end
  end
end

