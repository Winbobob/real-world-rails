require 'rails_helper'

RSpec.describe "url helpers", type: :helper do
  let(:headers) { helper.request.env }

  describe "#admin_root_url" do
    context "when on the public website" do
      before do
        headers["HTTP_HOST"]   = "petition.parliament.uk"
        headers["HTTPS"]       = "on"
        headers["SERVER_PORT"] = 443
      end

      it "generates a moderation website url" 

    end
  end

  describe "#home_url" do
    context "when on the moderation website" do
      before do
        headers["HTTP_HOST"]   = "moderate.petition.parliament.uk"
        headers["HTTPS"]       = "on"
        headers["SERVER_PORT"] = 443
      end

      it "generates a public website url" 

    end
  end
end

