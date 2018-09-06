require File.dirname(__FILE__) + "/../../spec_helper"

class MarkdownPlusFilter
  # dummy filter class
end

describe Radiant::Admin::PagesHelper do
  #dataset :users_and_pages

  before :each do
    @page = mock_model(Page)
    @errors = double("errors")
    allow(@page).to receive(:errors).and_return(@errors)
    allow(helper).to receive(:image).and_return('')
    allow(helper).to receive(:admin?).and_return(true)
    helper.instance_variable_set(:@page, @page)
  end

  it "should have meta errors if the page has errors on the slug" 


  it "should have meta errors if the page has errors on the breadcrumb" 


  it "should render the tag reference" 


  describe "filter_reference" do
    it "should determine the filter reference from the first part on the current page" 


    it "should render the filter reference for complex filter names" 

  end

  it "should have a default filter name" 


  it "should find the homepage" 


  it "should render javascript for the page editing form" 


end

