require 'spec_helper'

describe API::SystemHooks do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let!(:hook) { create(:system_hook, url: "http://example.com") }

  before do
    stub_request(:post, hook.url)
  end

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

  describe "POST /hooks" do
    it "creates new hook" 


    it "responds with 400 if url not given" 


    it "responds with 400 if url is invalid" 


    it "does not create new hook without url" 


    it 'sets default values for events' 


    it 'sets explicit values for events' 

  end

  describe "GET /hooks/:id" do
    it "returns hook by id" 


    it "returns 404 on failure" 

  end

  describe "DELETE /hooks/:id" do
    it "deletes a hook" 


    it 'returns 404 if the system hook does not exist' 


    it_behaves_like '412 response' do
      let(:request) { api("/hooks/#{hook.id}", admin) }
    end
  end
end

