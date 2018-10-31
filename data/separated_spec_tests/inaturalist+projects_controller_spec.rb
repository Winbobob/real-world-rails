require File.dirname(__FILE__) + '/../spec_helper'

describe ProjectsController, "spam" do
  let(:spammer_content) {
    p = Project.make!
    p.user.update_attributes(spammer: true)
    p
  }
  let(:flagged_content) {
    p = Project.make!
    Flag.make!(flaggable: p, flag: Flag::SPAM)
    p
  }

  it "should render 403 when the owner is a spammer" 


  it "should render 403 when content is flagged as spam" 

end

describe ProjectsController, "add" do
  let(:user) { User.make! }
  let(:project_user) { ProjectUser.make!(user: user) }
  let(:project) { project_user.project }
  before do
    sign_in user
  end
  it "should add to the project" 

  it "should set the project observation's user_id" 

end

describe ProjectsController, "join" do
  let(:user) { User.make! }
  let(:project) { Project.make! }
  before do
    sign_in user
  end
  it "should create a project user" 

  it "should accept project user parameters" 

end

describe ProjectsController, "leave" do
  let(:user) { User.make! }
  let(:project) { Project.make! }
  before do
    sign_in user
  end
  it "should destroy the project user" 

  describe "routes" do
    it "should accept DELETE requests" 

  end
end

describe ProjectsController, "search" do
  before(:each) { enable_elastic_indexing( Project, Place ) }
  after(:each) { disable_elastic_indexing( Project, Place ) }

  describe "for site with a place" do
    let(:place) { make_place_with_geom }
    before { Site.default.update_attributes(place_id: place.id) }

    it "should filter by place" 


    it "should allow removal of the place filter" 

  end
end

describe ProjectsController, "update" do
  let(:project) { Project.make! }
  let(:user) { project.user }
  before(:each) { enable_elastic_indexing( Observation ) }
  after(:each) { disable_elastic_indexing( Observation ) }
  before { sign_in user }
  it "should work for the owner" 

  it "allows bioblitz project to turn on aggregation" 

  it "should not allow a non-curator to turn on observation aggregation" 

  it "should not allow a non-curator to turn off observation aggregation" 

end

describe ProjectsController, "destroy" do
  let( :project ) { Project.make! }
  before do
    sign_in project.user
  end
  it "should not actually destroy the project" 

  it "should queue a job to destroy the project" 

end

