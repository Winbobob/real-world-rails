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


    it "returns top tag articles if tag param is present" 


    it "returns not tag articles if article and tag are not approved" 

  end

  describe "GET /api/articles/:id" do
    it "data for article based on ID" 

  end

  describe "POST /api/articles w/ current_user" do
    before do
      sign_in user1
    end
    it "creates ordinary article with proper params" 

    # rubocop:disable RSpec/ExampleLength
    it "creates article with front matter params" 

    it "creates article w/ series param" 

    it "creates article with front matter params" 

  end

  describe "PUT /api/articles/:id w/ current_user" do
    before do
      sign_in user1
      @article = create(:article, user: user1)
    end
    it "updates ordinary article with proper params" 

    it "updates ordinary article with proper params" 

    it "allows collection to be assigned via api" 

    it "does not allow collection which is not of user" 

  end
end

