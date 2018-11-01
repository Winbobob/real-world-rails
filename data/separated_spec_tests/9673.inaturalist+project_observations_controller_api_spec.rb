require File.dirname(__FILE__) + '/../spec_helper'

shared_examples_for "a ProjectObservationsController" do
  let(:user) { User.make! }
  let(:observation) { Observation.make!(:user => user) }
  let(:project) { Project.make! }
  let(:project_user) { ProjectUser.make!(:user => user, :project => project) }
  before do
    project_user
  end

  describe "create" do
    before(:each) { enable_elastic_indexing( Observation ) }
    after(:each) { disable_elastic_indexing( Observation ) }
    it "should work" 


    it "should succeed if there is an existing project observation" 


    it "should yield JSON for invalid record" 


    it "should yield JSON for invalid record if rules" 


    it "should update the observation in the elastic index" 


    describe "with project_id" do
      let(:new_project) { Project.make! }
      it "should add project observation" 


      it "should add project user" 

    end

    it "should set the user_id" 


    it "should not allow addition to invite-only projects if the observer wasn't invited" 


    it "should allow addition to projects if the observer isn't a member" 


    describe "with user preferences" do
      let(:other_observation) { Observation.make! }
      it "should work for people other than the observer" 

      it "should work for projects the observer hasn't joined" 

      it "should not allow non-observers if the observer doesn't allow it" 

      it "should not allow addition to projects the observer hasn't joined if the observer doesn't allow it" 

    end

    it "should not allow setting preferences if creator is not the observer" 

  end

  describe "update" do
    it "should not allow setting preferences if updater is not the observer" 

  end

  describe "destroy" do
    it "should work for the observer" 

    it "should work for a project curator" 

    it "should not work for anyone else" 

  end
end

describe ProjectObservationsController, "oauth authentication" do
  let(:token) { double :acceptable? => true, :accessible? => true, :resource_owner_id => user.id }
  before do
    request.env["HTTP_AUTHORIZATION"] = "Bearer xxx"
    allow(controller).to receive(:doorkeeper_token) { token }
  end
  it_behaves_like "a ProjectObservationsController"
end

describe ProjectObservationsController, "devise authentication" do
  before do
    http_login user
  end
  it_behaves_like "a ProjectObservationsController"
end

