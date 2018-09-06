require File.dirname(__FILE__) + '/../spec_helper'

shared_examples_for "a ProjectsController" do
  let(:user) { User.make! }
  let(:project) { Project.make! }

  describe "index" do
    describe "featured" do
      let(:featured) { Project.make!( title: "featured", featured_at: Time.now ) }
      let(:not_featured) { Project.make! }
      before do
        expect( featured ).to be_featured
        expect( not_featured ).not_to be_featured
      end
      it "should include featured projects" 

      it "should not include non-featured projects" 

      describe "with coordinates" do
        let(:featured_with_coordinates) {
          Project.make!(
            title: "featured with coordinates",
            featured_at: Time.now,
            latitude: 1,
            longitude: 1
          )
        }
        before do
          expect( featured_with_coordinates ).to be_featured
          expect( featured_with_coordinates.latitude ).not_to be_blank
          expect( featured.latitude ).to be_blank
        end
        it "should include featured projects without coordinates" 

        it "should sort projects without coordinates last" 

      end
    end
  end

  describe "join" do
    let(:unjoined_project) { Project.make! }
    it "should add a project user" 


    it "should set preferred_curator_coordinate_access to observer" 

  end

  describe "leave" do
    before(:each) { enable_elastic_indexing( Observation ) }
    after(:each) { disable_elastic_indexing( Observation ) }
    it "works" 


    it "should delete project observations by default" 


    it "should allow leaving without deleting project observations" 


    it "should allow leaving with coordinate access revocation" 

  end

  describe "members" do
    let(:new_user) { User.make! }
    before do
      sign_in new_user
    end
    it "should include project members" 

    it "should include role" 

  end

  describe "by_login" do
    let(:project) { Project.make! }
    before do
      sign_in user
    end
    it "should list joined projects" 

    it "should change when a user joins a project" 

  end

  describe "show" do
    it "should include posts_count" 

  end
end

describe ProjectsController, "oauth authentication" do
  let(:token) { double :acceptable? => true, :accessible? => true, :resource_owner_id => user.id }
  before do
    request.env["HTTP_AUTHORIZATION"] = "Bearer xxx"
    allow(controller).to receive(:doorkeeper_token) { token }
  end
  it_behaves_like "a ProjectsController"
end

describe ProjectsController, "devise authentication" do
  before do
    http_login user
  end
  it_behaves_like "a ProjectsController"
end

