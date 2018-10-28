require "rails_helper"

RSpec.describe "Moderations", type: :request do
  let(:user) { create(:user) }
  let(:article) { create(:article, user_id: user.id) }
  let(:comment) do
    create(:comment,
           commentable_id: article.id,
           commentable_type: "Article",
           user_id: user.id)
  end

  describe "GET /mod on articles" do
    context "when user is trusted" do
      it "responds with 200" 

    end

    context "when user is not trusted", proper_status: true do
      it "responds with 404" 

    end
  end

  describe "GET moderations comment" do
    context "when user is trusted" do
      it "responds with 200" 

    end

    context "when user is not trusted", proper_status: true do
      it "responds with 404" 

    end
  end
end

