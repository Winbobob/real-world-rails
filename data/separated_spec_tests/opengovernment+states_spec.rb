require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "State Page" do
  fixtures :committees, :states

  before do
    @texas = states(:tx)
    @request.host = "#{@texas.abbrev}.example.org"
    visit root_url
    click_link 'Texas'
  end

  context "Left nav" do
    it "should render left side nav" 


    it "nav links should take to the right pages" 

  end

  context "Legislature info" do
    it "should show the basic info" 


    it "should show people news" do 
      within("#people_mentions") do
        page.should have_content("Legislators in the News")
        page.should have_link("More")
      end
    end
  end

  context "Chamber tabs" do
    it "should show chamber info" 

  end


  context "Election Dates" do
    it "should show dates for next and last elections" do 
      page.should have_content "Next Election"
      page.should have_content "Last Election"
    end
  end
end

