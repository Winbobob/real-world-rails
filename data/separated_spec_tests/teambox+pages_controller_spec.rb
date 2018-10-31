require 'spec_helper'

describe ApiV1::PagesController do
  before do
    make_a_typical_project

    @page = @project.new_page(@user, {:name => 'Important plans!'})
    @page.save!
  end

  describe "#index" do
    it "shows pages in the project" 


    it "includes references" 


    it "shows pages in all projects" 


    it "shows no pages for archived projects" 


    it "shows pages created by a user" 


    it "shows no pages created by a ficticious user" 


    it "limits pages" 


    it "limits and offsets pages" 


    it "returns references for linked objects" 

    
    it "only shows private pages the user can see" 

  end

  describe "#show" do
    it "shows a page with references" 

    
    it "does not show an unwatched private page" 

  end

  describe "#create" do
    it "should allow participants to create pages" 

  end

  describe "#update" do
    it "should allow participants to modify the page" 


    it "should not allow non-participants to modify the page" 

    
    it "does not allow mystery users to update a private page" 


    it "allows the creator to update the private_ids" 


    it "does not allow a watcher to update the private_ids" 


    it "does not allow a stranger to update the private_ids" 

  end

  describe "#watch" do
    it "should allow participants to watch pages" 

    
    it "should not allow participants to watch private pages" 

  end

  describe "#unwatch" do
    it "should allow participants to uwatch pages" 

  end

  describe "#destroy" do
    it "should allow participants to destroy the page" 


    it "should not allow non-participants to destroy the page" 

  end
end

