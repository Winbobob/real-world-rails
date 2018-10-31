require 'spec_helper'

describe ApiV1::NotesController do
  before do
    make_a_typical_project

    @page = @project.new_page(@owner, {:name => 'New Employee Information'})
    @page.save!

    @note = @page.build_note({:name => 'Office Ettiquete'}).tap do |n|
      n.updated_by = @owner
      n.save
    end
  end

  describe "#index" do
    it "shows notes in a page" 


    it "shows all dividers without a page or project" 


    it "returns references for linked objects" 


    it "does not show private notes" 

  end

  describe "#show" do
    it "shows a note" 


    it "shows a note without a page or project id" 

  end

  describe "#create" do
    it "should allow participants to create notes" 


    it "should insert notes at the top of a page" 


    it "should insert notes at the footer of a page" 


    it "should insert notes before an existing widget" 


    it "should insert notes after an existing widget" 


    it "should not allow observers to create notes" 

  end

  describe "#update" do
    it "should allow participants to modify a note" 


    it "should not allow observers to modify a note" 

  end

  describe "#destroy" do
    it "should allow participants to destroy a note" 


    it "should not allow observers to destroy a note" 

  end
end

