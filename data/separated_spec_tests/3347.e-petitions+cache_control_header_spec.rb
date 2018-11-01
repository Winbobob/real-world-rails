require 'rails_helper'

RSpec.describe 'Cache-Control headers', type: :request do
  let(:cache_control) { response.headers['Cache-Control'] }
  let(:status) { response.status }

  context "when visiting the petition index page" do
    before do
      get "/petitions"
    end

    it "doesn't change the cache control headers" 

  end

  context "when visiting the petition show page" do
    let!(:petition) { FactoryBot.create(:open_petition) }

    before do
      get "/petitions/#{petition.id}"
    end

    it "doesn't change the cache control headers" 

  end

  context "when visiting the new petition page" do
    let!(:petition) { FactoryBot.create(:open_petition) }

    before do
      get "/petitions/new"
    end

    it "changes the cache control headers to 'no-store, no-cache'" 

  end

  context "when visiting the new sponsor page" do
    let!(:petition) { FactoryBot.create(:pending_petition) }

    before do
      get "/petitions/#{petition.id}/sponsors/new?token=#{petition.sponsor_token}"
    end

    it "changes the cache control headers to 'no-store, no-cache'" 

  end

  context "when visiting the new signature page" do
    let!(:petition) { FactoryBot.create(:open_petition) }

    before do
      get "/petitions/#{petition.id}/signatures/new"
    end

    it "changes the cache control headers to 'no-store, no-cache'" 

  end

  context "when visiting an admin page", admin: true do
    before do
      get "/admin/login"
    end

    it "changes the cache control headers to 'no-store, no-cache'" 

  end
end

