require 'spec_helper'

describe DividersController do
  before do
    make_a_typical_project
    
    @page = @project.new_page(@owner, {:name => 'Divisions'})
    @page.save!
    
    @divider = @page.build_divider({:name => 'Drawing a line here'}).tap do |n|
      n.updated_by = @owner
      n.save
    end
  end
  
  describe "#create" do
    it "should allow participants to create dividers" 

    
    it "should insert dividers at the top of a page" 

    
    it "should insert dividers at the footer of a page" 

    
    it "should insert dividers before an existing widget" 

    
    it "should insert dividers after an existing widget" 

    
    it "should not allow observers to create dividers" 

  end
  
  describe "#edit" do
    it "should redirect for html" 

    
    it "should render for m" 

  end
end

