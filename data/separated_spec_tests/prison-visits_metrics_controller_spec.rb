require 'rails_helper'

RSpec.describe MetricsController, type: :controller do
  context "IP & key restrictions" do
    it "are enabled" 

  end

  context "when accessing the site from the right IP address" do
    before :each do
      allow(controller).to receive(:reject_without_key_or_trusted_ip!)
    end

    context "for all prisons" do
      it "renders a html view" 


      it "renders a csv view" 


      after :each do
        expect(response).to be_success
      end
    end
  end
end

