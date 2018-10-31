require File.dirname(__FILE__) + '/../spec_helper'

shared_examples_for "an ObservationPhotosController" do
  before(:each) { enable_elastic_indexing( Observation ) }
  after(:each) { disable_elastic_indexing( Observation ) }

  describe "create" do
    let(:file) { fixture_file_upload('files/cuthona_abronia-tagged.jpg', 'image/jpeg') }
    it "should work" 


    it "should not duplicate observation photos with the same uuid" 


    it "should not include photo metadata" 


    it "should not allow adding a photo by another user" 

  end

  describe "update" do
    it "should work" 

    describe "when the observation photo does not exist" do
      let(:file) { fixture_file_upload('files/cuthona_abronia-tagged.jpg', 'image/jpeg') }
      it "should create an observation photo" 

      it "should not create an observation photo if the user does not own the observation" 

    end
    it "should return an error when you try to update an observation photo that isn't yours" 

  end

  it "should destroy" 


end

describe ObservationPhotosController, "oauth authentication" do
  let(:user) { User.make! }
  let(:token) { double :acceptable? => true, :accessible? => true, :resource_owner_id => user.id }
  let(:observation) { Observation.make!(:user => user)}
  before do
    request.env["HTTP_AUTHORIZATION"] = "Bearer xxx"
    allow(controller).to receive(:doorkeeper_token) { token }
  end
  it_behaves_like "an ObservationPhotosController"
end

describe ObservationPhotosController, "devise authentication" do
  let(:user) { User.make! }
  let(:observation) { Observation.make!(:user => user)}
  before do
    http_login user
  end
  it_behaves_like "an ObservationPhotosController"
end

