require 'rails_helper'

RSpec.describe StaffController, type: :controller do
  context "IP & key restrictions" do
    it "are enabled" 

  end

  context "when accessing the site from the right IP address" do
    before :each do
      allow(controller).to receive(:reject_without_key_or_trusted_ip!)
    end

    context "for each staff page" do
      it "renders a html view for index" 


      it "renders a html view for changes" 


      it "renders a html view for downloads" 


      it "renders a html view for guide" 


      it "renders a html view for training" 


      it "renders a html view for troubleshooting" 


      after :each do
        expect(response).to be_success
      end
    end
  end
end

