require 'spec_helper'

describe "projects/new", :type => :view do

  before(:each) { assign(:project, Project.new) }

  it "should include the server time" 


  it 'should render all the project specific fields as hidden' 


  describe "error messages" do
    it "should not be visible when the page is first rendered" 


    it "should be visible when the new project record is invalid" 

  end

end

