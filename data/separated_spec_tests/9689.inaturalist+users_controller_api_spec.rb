require File.dirname(__FILE__) + '/../spec_helper'

shared_examples_for "a signed in UsersController" do
  before(:all) { User.destroy_all }
  before(:each) do
    enable_elastic_indexing( Observation )
    enable_has_subscribers
  end
  after(:each) do
    disable_elastic_indexing( Observation )
    disable_has_subscribers
  end
  let(:user) { User.make! }
  it "should show email for edit" 


  it "should show the dashboard" 


  describe "update" do
    it "should remove the user icon with icon_delete param" 

    it "should not remove the user icon with no user[icon] param" 

    describe "observation license preference" do
      it "should update past observations if requested" 

      it "should update re-index past observations" 

    end
    describe "photo license preference" do
      it "should update past observations if requested" 

      # Honestly not sure why this passes
      it "should update re-index past observations" 

    end
  end

  describe "new_updates" do
    before { CONFIG.has_subscribers = :enabled }
    after { CONFIG.has_subscribers = :disabled }
    it "should show recent updates" 


    it "return mentions" 


    it "should filter by resource_type" 


    it "should filter by notifier_type" 


    it "should allow user to skip marking the updates as viewed" 

  end

  describe "search" do
    it "should search by username" 


    it "should allow email searches" 

  end

  describe "test_groups" do
    it "should be set with update" 

  end

end

describe UsersController, "oauth authentication" do
  let(:token) { double :acceptable? => true, :accessible? => true, :resource_owner_id => user.id }
  before do
    request.env["HTTP_AUTHORIZATION"] = "Bearer xxx"
    allow(controller).to receive(:doorkeeper_token) { token }
  end
  it_behaves_like "a signed in UsersController"
end

describe UsersController, "devise authentication" do
  before do
    http_login user
  end
  it_behaves_like "a signed in UsersController"
end

describe UsersController, "without authentication" do
  it "should not show email for edit" 


  describe "show" do
    let( :user ) { User.make! }
    it "should show observations_count" 

    it "should show identifications_count" 

  end

  describe "search" do
    it "should search by username" 

    
    it "should not allow email searches" 


    it "can order by activity" 

  end
end

