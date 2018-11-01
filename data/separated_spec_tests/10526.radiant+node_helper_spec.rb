require File.dirname(__FILE__) + "/../../spec_helper"

describe Radiant::Admin::NodeHelper do
  #dataset :users_and_pages

  before :each do
    @cookies = {}
    @errors = double("errors")
    allow(helper).to receive(:cookies).and_return(@cookies)
    allow(helper).to receive(:homepage).and_return(nil)
    @page = mock_model(Page, class_name: 'Page')
    allow(@page).to receive(:sheet?).and_return(false) # core extension alters the behavior
    allow(helper).to receive(:image).and_return('')
    allow(helper).to receive(:admin?).and_return(true)
    helper.instance_variable_set(:@page, @page)
  end

  it "should render a sitemap node" 


  it "should show all nodes when on the remove action" 


  it "should not show all nodes automatically when not in the remove action" 


  it "should determine which rows to expand" 


  it "should determine whether the current node should be expanded" 


  it "should determine the left padding for the current level" 


  it "should determine the class of a parent node" 


  it "should display an icon for the current node" 


  it "should display the virtual icon if the current node is virtual" 


  it "should render the title of the current node" 


  it "should render the title of the current node with HTML entities escaped" 


  it "should render the page type if it's not Page" 


  it "should not render the page type if it's Page" 


  it "should render the busy spinner" 



end

