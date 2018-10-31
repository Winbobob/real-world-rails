require 'spec_helper'

describe API::V3::SystemHooks do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let!(:hook) { create(:system_hook, url: "http://example.com") }

  before { stub_request(:post, hook.url) }

  describe "GET /hooks" do
    context "when no user" do
      it "returns authentication error" 

    end

    context "when not an admin" do
      it "returns forbidden error" 

    end

    context "when authenticated as admin" do
      it "returns an array of hooks" 

    end
  end

  describe "DELETE /hooks/:id" do
    it "deletes a hook" 


    it 'returns 404 if the system hook does not exist' 

  end
end

