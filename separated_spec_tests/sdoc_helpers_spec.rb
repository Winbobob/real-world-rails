require "spec_helper"

describe SDoc::Helpers do
  before :each do
    @helpers = Class.new do
      include SDoc::Helpers
    end.new
  end

  describe "#strip_tags" do
    it "should strip out HTML tags from the given string" 

  end

  describe "#truncate" do
    it "should truncate the given text around a given length" 

  end
end

