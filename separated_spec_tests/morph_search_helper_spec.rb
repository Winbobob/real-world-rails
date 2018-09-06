require 'spec_helper'

describe SearchHelper do
  describe ".no_search_results_message" do
    it { expect(helper.no_search_results_message("scrapers", "bibble")).to eq "Sorry, we couldn't find any scrapers relevant to your search term <strong>“bibble”</strong>."}

    it "should allow html in things" 


    it "should allow escape html if things is not html safe" 


    it "should escape the search term" 


    it "should be html safe" 

  end
end

