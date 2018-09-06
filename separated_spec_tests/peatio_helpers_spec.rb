require 'spec_helper'

module APIv2

  class AuthTest < Grape::API
    get("/auth_test") do
      authenticate!
      current_user
    end
  end

  class Mount
    mount AuthTest
  end

end

describe APIv2::Helpers do

  context "#authentic?" do

    let(:tonce)  { time_to_milliseconds }
    let!(:token) { create(:api_token) }

    context "Authenticate using headers" do
      pending
    end

    context "Authenticate using params" do
      let(:payload) { "GET|/api/v2/auth_test|access_key=#{token.access_key}&foo=bar&hello=world&tonce=#{tonce}" }
      let(:signature) { APIv2::Auth::Utils.hmac_signature(token.secret_key, payload) }

      it "should response successfully" 


      it "should set current user" 


      it "should fail authorization" 

    end

  end

end

