require 'rails_helper'

describe SearchController do

  context "integration" do
    before do
      SearchIndexer.enable
    end

    it "can search correctly" 


    it 'performs the query with a type filter' 


    context 'searching by topic id' do
      it 'should not be restricted by minimum search term length' 


      it "should return the right result" 

    end
  end

  context "#query" do
    it "logs the search term" 


    it "doesn't log when disabled" 

  end

  context "#show" do
    it "logs the search term" 


    it "doesn't log when disabled" 

  end

  context "search context" do
    it "raises an error with an invalid context type" 


    it "raises an error with a missing id" 


    context "with a user" do
      let(:user) { Fabricate(:user) }

      it "raises an error if the user can't see the context" 


      it 'performs the query with a search context' 

    end

  end

  context "#click" do
    after do
      SearchLog.clear_debounce_cache!
    end

    it "doesn't work wthout the necessary parameters" 


    it "doesn't record the click for a different user" 


    it "records the click for a logged in user" 


    it "records the click for an anonymous user" 


    it "doesn't record the click for a different IP" 


    it "records the click for search result type category" 


    it "records the click for search result type tag" 

  end
end

