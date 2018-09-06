require 'spec_helper'

describe ApiV1::ActivitiesController do
  before do
    make_a_typical_project

    @other_project = Factory.create(:project, :user => @observer)
    @other_project.add_user(@user)
  end

  describe "#index" do
    it "shows activities in all projects" 

    
    it "shows uploads in comments when requested" 


    it "shows activities as JSON when requested with :text format" 


    it "shows activities with a JSONP callback" 


    it "shows activities in a project" 


    it "shows activities by a user" 


    it "shows no activities for a ficticious user" 


    it "limits activities" 


    it "limits activities to the hard limit" 


    it "limits and offsets activities" 


    it "returns references for linked objects" 


    it "returns comment references for conversation and task objects" 


    it "should not allow oauth users without :read_projects to view activities" 


    it "should allow oauth users with :read_projects to view activities" 


    it "restricts activities by target" 


    it "restricts activities by comment target" 


    it "does not show activities for unwatched private objects" 


    it "can ask only for unique threads" 


    it "shows all the threads and correctly ordered" 

  end

  describe "#show" do
    it "shows an activity with references" 


    it "does not show an activity for an unwatched private object" 

  end
end

