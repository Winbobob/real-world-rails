require File.dirname(__FILE__) + '/../spec_helper'

shared_examples_for "a GuidesController" do
  let(:user) { User.make! }

  describe GuidesController, "index" do
    it "should respond to page and per_page" 

  end

  describe GuidesController, "user" do
    it "should show the guides by the signed in user" 

  end
end

describe GuidesController, "oauth authentication" do
  let(:token) { double :acceptable? => true, :accessible? => true, :resource_owner_id => user.id, :application => OauthApplication.make! }
  before do
    request.env["HTTP_AUTHORIZATION"] = "Bearer xxx"
    allow(controller).to receive(:doorkeeper_token) { token }
  end
  it_behaves_like "a GuidesController"
end

describe GuidesController, "devise authentication" do
  before { http_login(user) }
  it_behaves_like "a GuidesController"
end

