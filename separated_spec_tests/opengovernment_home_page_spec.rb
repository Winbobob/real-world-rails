require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Home Page" do
  before do
    visit root_path
    page.should have_css('.find_form > form > input#addr')
  end

  it "given an address it should the show legislators in the area" 


  it "should redirect to home page when somebody clicks on logo" 

end

