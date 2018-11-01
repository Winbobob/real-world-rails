require 'rails_helper'

describe OmniauthCallbacksController do
  before do
    sign_in users(:bob)
    OmniAuth.config.test_mode = true
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "accepting a callback url" do
    it "should update the user's credentials" 

  end

  describe "handling a provider with non-standard omniauth options" do
    it "should update the user's credentials" 

  end
end

