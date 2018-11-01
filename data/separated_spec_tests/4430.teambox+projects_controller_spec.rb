require 'spec_helper'

describe ApiV1::ProjectsController do
  before do
    make_a_typical_project

    @other_project = Factory.create(:project, :user => @user)
  end

  describe "#index" do
    it "shows projects the user belongs to" 


    it "shows projects with a JSONP callback" 


    it "shows projects as JSON when requested with the :text format" 


    it "does not show projects the user doesn't belong to" 


    it "limits projects" 


    it "limits and offsets projects" 

  end

  describe "#create" do
    it "creates a project" 

  end

  describe "#update" do
    it "should allow an admin to update the project" 


    it "should not allow a non-admin to update the project" 

  end

  describe "#show" do
    it "shows a project with references" 


    it "shows a project by id" 


    it "should not show a project the user doesn't belong to" 


    it "should not show a project which does not exist" 

  end

  describe "#destroy" do
    it "should destroy a project" 


    it "should only allow admins to destroy a project" 

  end

end

