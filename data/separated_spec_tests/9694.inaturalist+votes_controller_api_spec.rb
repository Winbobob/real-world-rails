require File.dirname(__FILE__) + '/../spec_helper'

shared_examples_for "a VotesController" do
  let(:user) { User.make! }
  before { enable_has_subscribers }
  after { disable_has_subscribers }

  describe "vote" do
    before(:each) { enable_elastic_indexing( Observation ) }
    after(:each) { disable_elastic_indexing( Observation ) }
    let(:o) { Observation.make! }
    it "should default to a positive vote" 

    it "should include votes in the respose" 

    it "should accept a scope" 

    it "should allow multiple votes per user in different scopes" 


    it "should generate an update for the owner of the votable resource" 


    it "should not generate an update for the owner of the votable resource if the owner voted" 


    it "should subscribe the voter to updates on the votable" 


    it "should increment cached_votes_total" 

  end
  
  describe "unvote" do
    let(:o) { Observation.make! }
    before do
      o.like_by user
    end
    it "should remove the vote" 

    it "should decrement cached_votes_total" 

  end
end

describe VotesController, "oauth authentication" do
  let(:token) { double :acceptable? => true, :accessible? => true, :resource_owner_id => user.id, :application => OauthApplication.make! }
  before do
    request.env["HTTP_AUTHORIZATION"] = "Bearer xxx"
    allow(controller).to receive(:doorkeeper_token) { token }
  end
  it_behaves_like "a VotesController"
end

describe VotesController, "devise authentication" do
  before { http_login(user) }
  it_behaves_like "a VotesController"
end

