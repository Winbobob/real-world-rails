require 'rails_helper'

RSpec.describe SharingHelper, type: :helper do
  let(:petition) { double(:petition, to_param: "100000", action: "Do something") }
  let(:headers) { helper.request.env }

  before do
    headers["HTTP_HOST"]   = "petition.parliament.uk"
    headers["HTTPS"]       = "on"
    headers["SERVER_PORT"] = 443
  end

  describe "#share_via_facebook_url" do
    it "generates a share via Facebook url" 

  end

  describe "#share_via_email_url" do
    it "generates a share via email url" 

  end

  describe "#share_via_twitter_url" do
    it "generates a share via Twitter url" 

  end

  describe "#share_via_whatsapp_url" do
    it "generates a share via Whatsapp url" 

  end
end

