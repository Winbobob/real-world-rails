require 'spec_helper'

describe NotesController do
  before do
    make_a_typical_project
    
    @page = @project.new_page(@owner, {:name => 'New Employee Information'})
    @page.save!
    
    @note = @page.build_note({:name => 'Office Ettiquete'}).tap do |n|
      n.updated_by = @owner
      n.save
    end
  end
  
  describe "#create" do
    it "should allow participants to create notes" 

    
    it "should insert notes at the top of a page" 

    
    it "should insert notes at the footer of a page" 

    
    it "should insert notes before an existing widget" 

    
    it "should insert notes after an existing widget" 

    
    it "should not allow observers to create notes" 

  end
  
  describe "#edit" do
    it "should redirect for html" 

    
    it "should render for m" 

  end
end

