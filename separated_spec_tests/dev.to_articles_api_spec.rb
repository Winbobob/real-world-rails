require "rails_helper"

RSpec.describe "ArticlesApi", type: :request do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  describe "GET /api/articles" do
    it "returns json response" 


    it "returns featured articles with no params" 


    it "returns user articles if username param is present" 


    # rubocop:disable RSpec/ExampleLength
    it "returns organization articles if username param is present" 

    # rubocop:enable RSpec/ExampleLength

    it "returns tag articles if tag param is present" 


    it "returns not tag articles if article and tag are not approved" 

  end

  describe "GET /api/articles/:id" do
    it "data for article based on ID" 

  end
end

