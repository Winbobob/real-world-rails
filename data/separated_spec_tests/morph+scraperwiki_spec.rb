require 'spec_helper'

describe Morph::Scraperwiki do
  describe "#sqlite_database" do
    it "should get the scraperwiki sqlite database via their api" 


    it "should raise an exception if the dataproxy connection time out" 

  end

  describe ".content" do
    it "should grab the contents of a url" 

  end

  describe '#exists?' do
    it { expect(Morph::Scraperwiki.new(nil).exists?).to_not be_truthy }
    it { expect(Morph::Scraperwiki.new('').exists?).to_not be_truthy }

    it "should say non existent scrapers don't exist" 

  end
end

