require "spec_helper"

module Refinery
  describe "site bar", :type => :feature do
    refinery_login

    describe "logout link" do
      let(:logout_path) { '/refinery/logout' }

      context "when set" do
        before do
          allow(Refinery::Core).to receive(:refinery_logout_path).and_return(logout_path)
          visit Refinery::Core.backend_path
        end

        it "is present" 

      end

      context "when not set" do
        it "is not present" 

      end
    end

    context "when in backend" do
      before do
        visit Refinery::Core.backend_path
      end

      it "has a 'switch to your website button'" 


      it "switches to frontend" 

    end

    context "when in frontend" do
      # make a page in order to avoid 404
      let!(:root_page) { FactoryBot.create(:page, :link_url => "/") }
      before { visit refinery.root_path }

      it "has a 'switch to your website editor' button" 


      it "switches to backend" 


      it "has an 'edit this page' button" 


    end
  end
end

