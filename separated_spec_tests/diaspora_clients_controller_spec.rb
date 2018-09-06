# frozen_string_literal: true

describe Api::OpenidConnect::ClientsController, type: :controller, suppress_csrf_verification: :none do
  describe "#create" do
    context "when valid parameters are passed" do
      it "should return a client id" 

    end

    context "when valid parameters with jwks is passed" do
      it "should return a client id" 

    end

    context "when valid parameters with jwks_uri is passed" do
      it "should return a client id" 

    end

    context "when redirect uri is missing" do
      it "should return a invalid_client_metadata error" 

    end
  end

  describe "#find" do
    let!(:client) { FactoryGirl.create(:o_auth_application) }

    context "when an OIDC client already exists" do
      it "should return a client id" 

    end

    context "when an OIDC client doesn't already exist" do
      it "should return the appropriate error" 

    end
  end
end

