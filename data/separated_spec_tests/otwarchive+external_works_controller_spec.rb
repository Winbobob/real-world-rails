require 'spec_helper'

describe ExternalWorksController do
  describe "GET #fetch" do
    url = "http://ao3testing.dreamwidth.org/593.html"

    before(:each) do
      @external_work = FactoryGirl.create(:external_work, url: url)
    end

    context "URL that has an external work" do
      it "responds with json" 


      it "responds with the matching work" 


      before do
        @external_work2 = FactoryGirl.create(:external_work, url: url)
      end

      it "responds with the first matching work" 

    end

    context "URL that does not have an external work" do
      url_2 = "http://ao3testing.dreamwidth.org"

      it "responds with json" 


      it "responds with blank" 

    end
  end
end

