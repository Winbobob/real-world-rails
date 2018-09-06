require "spec_helper"

describe "HTTP basic auth", type: :request do
  before do
    APP_CONFIG.use_http_auth = true
    APP_CONFIG.http_auth_username = "testuser"
    APP_CONFIG.http_auth_password = "secret"
  end

  before(:each) do
    @domain = "market.custom.org"
    @http_url = "http://#{@domain}"
    @https_url = "https://#{@domain}"
    @community = FactoryGirl.create(:community, :domain => @domain, use_domain: true)

    # Refresh from DB
    @community.reload
  end

  after do
    APP_CONFIG.use_http_auth = false
  end

  it "is required when enabled" 


  it "is bypassed for internal API" 


  it "is not required when disabled" 


  context "when always_use_ssl is true" do
    before do
      APP_CONFIG.always_use_ssl = true
    end

    after do
      APP_CONFIG.always_use_ssl = false
    end

    it "is required after redirect" 


    it "is required when using HTTPS" 

  end
end

