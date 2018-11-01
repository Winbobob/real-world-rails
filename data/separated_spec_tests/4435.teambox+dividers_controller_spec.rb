require 'spec_helper'

describe ApiV1::DividersController do
  before do
    make_a_typical_project

    @page = @project.new_page(@owner, {:name => 'Divisions'})
    @page.save!

    @divider = @page.build_divider({:name => 'Drawing a line here'}).tap do |n|
      n.updated_by = @owner
      n.save
    end
  end

  describe "#index" do
    it "shows dividers in a page" 


    it "shows all dividers without a page or project" 


    it "returns references for linked objects" 


    it "does not show private dividers" 

  end

  describe "#show" do
    it "shows a divider" 


    it "shows a divider without a page or project id" 

  end

  describe "#create" do
    it "should allow participants to create dividers" 


    it "should insert dividers at the top of a page" 


    it "should insert dividers at the footer of a page" 


    it "should insert dividers before an existing widget" 


    it "should insert dividers after an existing widget" 


    it "should not allow observers to create dividers" 

  end

  describe "#update" do
    it "should allow participants to modify a divider" 


    it "should not allow observers to modify a divider" 

  end

  describe "#destroy" do
    it "should allow participants to destroy a divider" 


    it "should not allow observers to destroy a divider" 

  end
end

