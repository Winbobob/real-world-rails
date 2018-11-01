require "spec_helper"

describe "TaxonDescribers" do
  describe "Wikipedia" do

    before(:all) do
      @animalia = Taxon.make!(name: "Animalia")
      @wikipedia = TaxonDescribers::Wikipedia.new
    end

    it "creates the endpoint" 


    it "creates the endpoint based on locale" 


    it "caches the result" 


    it "caches the result based on locale" 


    it "strips references and errors from html" 


    it "generates a page_url for a taxon" 


  end
end

