require 'spec_helper'

describe "redirects" do
  describe "api redirects" do
    it "should not redirect the normal home page on the normal subdomain" 


    describe "requests on the api subdomain" do
      it "to the home page should redirect" 


      it "to the applications index page for html should redirect" 


      it "to the applications index page for js should not redirect" 

    end
  end

  describe "ssl redirects" do
    context "in the production environment" do
      before do
        allow(Rails.env).to receive(:production?).and_return true
      end

      it "should redirect to ssl" 


      it "should redirect the api howto page" 

    end
  end
end

