require 'spec_helper'

describe APIv2::Auth::Middleware do

  class TestApp < Grape::API
    helpers APIv2::Helpers
    use APIv2::Auth::Middleware

    get '/' do
      authenticate!
      current_user.email
    end
  end

  let(:app) do
    TestApp.new
  end

  let(:token) { create(:api_token) }

  it "should refuse request without credentials" 


  it "should refuse request with incorrect credentials" 


  it "should authorize request with correct param credentials" 


end

