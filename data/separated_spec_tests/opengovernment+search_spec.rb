require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Search" do
  fixtures :states

  before do
    @texas = states(:tx)
    @request.host = "#{@texas.abbrev}.example.org"
    visit root_url
  end

  it "should have the search box" 


  context "by everything" do
    it "should show all the search results" 

  end

  context "by bills" do
    it "should show matching bills" 

  end

  context "by legislators" do
    it "should show matching legislators" 

  end

  context "by committes" do
    it "should show matching committees" 

  end

  context "by contributions" do
    it "should show matching contributions" 

  end
end

