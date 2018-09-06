# frozen_string_literal: true

describe Api::OpenidConnect::IdTokensController, type: :controller do
  describe "#jwks" do
    before do
      get :jwks
    end

    it "should contain a public key that matches the internal private key" 

  end
end

