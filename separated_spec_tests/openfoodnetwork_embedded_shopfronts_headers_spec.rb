require 'spec_helper'

describe "setting response headers for embedded shopfronts", type: :request do
  include AuthenticationWorkflow

  let(:enterprise) { create(:distributor_enterprise) }
  let(:user) { enterprise.owner }

  before do
    quick_login_as(user)
  end

  context "with embedded shopfront disabled" do
    before do
      Spree::Config[:enable_embedded_shopfronts] = false
    end

    it "disables iframes by default" 

  end

  context "with embedded shopfronts enabled" do
    before do
      Spree::Config[:enable_embedded_shopfronts] = true
    end

    context "but no whitelist" do
      before do
        Spree::Config[:embedded_shopfronts_whitelist] = ""
      end

      it "disables iframes" 

    end

    context "with a valid whitelist" do
      before do
        Spree::Config[:embedded_shopfronts_whitelist] = "example.com external-site.com"
        allow_any_instance_of(ActionDispatch::Request).to receive(:referer).and_return('http://www.external-site.com/shop?embedded_shopfront=true')
      end

      it "allows iframes on certain pages when enabled in configuration" 

    end
  end
end

