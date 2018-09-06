# frozen_string_literal: true

describe Api::OpenidConnect::AuthorizationsController, type: :request do
  let!(:client) { FactoryGirl.create(:o_auth_application) }

  before do
    sign_in alice, scope: :user
  end

  describe "#new" do
    context "when not yet authorized" do
      context "when valid parameters are passed" do
        context "as GET request" do
          it "should return a form page" 

        end

        context "using claims" do
          it "should return a form page" 

        end

        context "as a request object" do
          it "should return a form page" 

        end

        context "as a request object with no claims" do
          it "should return a form page" 

        end

        context "as POST request" do
          it "should return a form page" 

        end
      end

      context "when client id is missing" do
        it "should return an bad request error" 

      end

      context "when redirect uri is missing" do
        context "when only one redirect URL is pre-registered" do
          it "should return a form page" 

        end
      end

      context "when multiple redirect URLs are pre-registered" do
        it "should return an invalid request error" 

      end

      context "when redirect URI does not match pre-registered URIs" do
        it "should return an invalid request error" 

      end

      context "when an unsupported scope is passed in" do
        it "should return an invalid scope error" 

      end

      context "when nonce is missing" do
        it "should return an invalid request error" 

      end

      context "when prompt is none" do
        it "should return an interaction required error" 

      end

      context "when prompt is none and user not signed in" do
        before do
          sign_out :user
        end

        it "should return an interaction required error" 

      end

      context "when prompt is none and consent" do
        it "should return an interaction required error" 

      end

      context "when prompt is select_account" do
        it "should return an account_selection_required error" 

      end

      context "when prompt is none and client ID is invalid" do
        it "should return an account_selection_required error" 

      end

      context "when prompt is none and redirect URI does not match pre-registered URIs" do
        it "should return an account_selection_required error" 

      end

      context "when XSS script is passed as name" do
        it "should escape html" 

      end
    end

    context "when already authorized" do
      before do
        Api::OpenidConnect::Authorization.create!(
          o_auth_application: client, user: alice, redirect_uri: "http://localhost:3000/", scopes: ["openid"])
      end

      context "when valid parameters are passed" do
        before do
          get new_api_openid_connect_authorization_path, params: {client_id: client.client_id,
              redirect_uri: "http://localhost:3000/", response_type: "id_token",
              scope: "openid", nonce: 413_093_098_3, state: 413_093_098_3}
        end

        it "should return the id token in a fragment" 


        it "should return the passed in state" 

      end

      context "when prompt is none" do
        it "should return the id token in a fragment" 

      end

      context "when prompt contains consent" do
        it "should return a consent form page" 

      end

      context "when scopes are escalated" do
        before do
          get new_api_openid_connect_authorization_path, params: {client_id: client.client_id,
              redirect_uri: "http://localhost:3000/", response_type: "id_token",
              scope: "openid read", nonce: 413_093_098_3, state: 413_093_098_3}
        end

        it "should receive another authorization request" 


        it "should overwrite old authorization scope after approval" 

      end
    end
  end

  describe "#create" do
    context "when id_token token" do
      before do
        get new_api_openid_connect_authorization_path, params: {client_id: client.client_id,
            redirect_uri: "http://localhost:3000/", response_type: "id_token token",
            scope: "openid", nonce: 418_093_098_3, state: 418_093_098_3}
      end

      context "when authorization is approved" do
        before do
          post api_openid_connect_authorizations_path, params: {approve: "true"}
        end

        it "should return the id token in a fragment" 


        it "should return a valid access token in a fragment" 

      end
    end

    context "when id_token" do
      before do
        get new_api_openid_connect_authorization_path, params: {client_id: client.client_id,
            redirect_uri: "http://localhost:3000/", response_type: "id_token",
            scope: "openid", nonce: 418_093_098_3, state: 418_093_098_3}
      end

      context "when authorization is approved" do
        before do
          post api_openid_connect_authorizations_path, params: {approve: "true"}
        end

        it "should return the id token in a fragment" 


        it "should return the passed in state" 

      end

      context "when authorization is denied" do
        before do
          post api_openid_connect_authorizations_path, params: {approve: "false"}
        end

        it "should return an error in the fragment" 


        it "should NOT contain a id token in the fragment" 

      end
    end

    context "when code" do
      before do
        get new_api_openid_connect_authorization_path, params: {client_id: client.client_id,
            redirect_uri: "http://localhost:3000/", response_type: "code",
            scope: "openid", nonce: 418_093_098_3, state: 418_093_098_3}
      end

      context "when authorization is approved" do
        before do
          post api_openid_connect_authorizations_path, params: {approve: "true"}
        end

        it "should return the code" 


        it "should return the passed in state" 

      end

      context "when authorization is denied" do
        before do
          post api_openid_connect_authorizations_path, params: {approve: "false"}
        end

        it "should return an error" 


        it "should NOT contain code" 

      end
    end
  end

  describe "#destroy" do
    context "with existent authorization" do
      it "removes the authorization" 

    end

    context "with non-existent authorization" do
      it "raises an error" 

    end
  end
end

