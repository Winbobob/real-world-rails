require 'spec_helper'

describe EmbeddedPageService do
  let(:enterprise_slug) { 'test-enterprise' }
  let(:params) { { controller: 'enterprises', action: 'shop', id: enterprise_slug, embedded_shopfront: true } }
  let(:session) { {} }
  let(:request) { ActionController::TestRequest.new('HTTP_HOST' => 'ofn-instance.com', 'HTTP_REFERER' => 'https://embedding-enterprise.com') }
  let(:response) { ActionController::TestResponse.new(200, 'X-Frame-Options' => 'DENY', 'Content-Security-Policy' => "frame-ancestors 'none'") }
  let(:service) { EmbeddedPageService.new(params, session, request, response) }

  before do
    Spree::Config.set(
      enable_embedded_shopfronts: true,
      embedded_shopfronts_whitelist: 'embedding-enterprise.com example.com'
    )
  end

  describe "processing embedded page requests" do
    context "when the request's referer is in the whitelist" do
      before { service.embed! }

      it "sets the response headers to enables embedding requests from the embedding site" 


      it "sets session variables" 


      it "publicly reports that embedded layout should be used" 

    end

    context "when embedding is enabled for a different site in the current session" do
      before do
        session[:embedding_domain] = 'another-enterprise.com'
        session[:shopfront_redirect] = '/another-enterprise/shop?embedded_shopfront=true'
        service.embed!
      end

      it "resets the session variables for the new request" 

    end

    context "when the request's referer is not in the whitelist" do
      before do
        Spree::Config.set(embedded_shopfronts_whitelist: 'example.com')
        service.embed!
      end

      it "does not enable embedding" 

    end
  end
end

