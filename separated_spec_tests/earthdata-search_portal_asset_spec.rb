require "spec_helper"

describe "Portal assets", reset: false do
  include Helpers::CollectionHelpers

  it "Visiting an Earthdata Search portal loads the assets configured for that portal, updating scripts and styles accordingly", acceptance: true do
    load_page :search, portal: 'complex'

    expect(page).to have_text("Example Portal")
    expect(page).to have_link("Complex")
    expect(page).to have_link("Example Link")
    expect(page).to have_css('a[href="https://example.com/logo"]')
  end

  context "on the default home page" do
    before :all do
      load_page :search
    end

    it "does not show an external logo link" 


    it "does not show a navigation bar" 


    it "has a logo title of 'Search'" 


    it "has a page title of 'Earthdata Search'" 

  end

  context "on the home page of a portal with minimal configuration" do
    before :all do
      load_page :search, portal: 'simple'
    end

    it "does not show an external logo link" 


    it "does not show a navigation bar" 


    it "has a logo title the same as the portal id" 


    it "has a page title of 'Earthdata Search'" 

  end

  context "on the home page of a portal with full configuration" do
    before :all do
      load_page :search, portal: 'complex'
    end

    it "shows an external logo link with custom image" 


    it "shows a navigation bar with custom links" 


    it "uses a supplied logo title" 


    it "uses page title augmented with the portal name" 


    it "runs supplied Javascript" 

  end
end

