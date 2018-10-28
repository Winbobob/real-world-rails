# http://localhost:3000/api/comments?a_id=23
require "rails_helper"

RSpec.describe "ArticlesApi", type: :request do
  let(:article) { create(:article) }

  before do
    FactoryBot.create(:comment, commentable_type: "Article", commentable_id: article.id)
    FactoryBot.create(:comment, commentable_type: "Article", commentable_id: article.id)
  end

  describe "GET /api/comments" do
    it "returns not found if inproper article id" 


    it "returns comments for article passed" 

  end
end

