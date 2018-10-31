require "rails_helper"

RSpec.describe "Reactions", type: :request do
  let(:user)    { create(:user) }
  let(:article) { create(:article, user_id: user.id) }
  let(:comment) { create(:comment, commentable_id: article.id) }

  describe "GET /reactions?article_id=:article_id" do
    context "when signed in" do
      before do
        sign_in user
        get "/reactions?article_id=#{article.id}"
      end

      it "returns reactions count for article" 


      it "does not set cache control headers" 


      it "does not set Fastly cache control and surrogate control headers" 

    end

    context "when signed out" do
      before { get "/reactions?article_id=#{article.id}" }

      it "returns reactions count for article" 


      it "sets the surrogate key header equal to params for article" 


      it "sets Fastly cache control and surrogate control headers" 

    end
  end

  describe "GET /reactions?commentable_id=:article.id&commentable_type=Comment" do
    context "when signed in" do
      before do
        sign_in user
        get "/reactions?commentable_id=#{article.id}&commentable_type=Comment"
      end

      it "returns positive reaction counts" 


      it "does not set surrogate key headers" 


      it "does not set Fastly cache control and surrogate control headers" 

    end

    context "when signed out" do
      before { get "/reactions?commentable_id=#{article.id}&commentable_type=Comment" }

      it "returns positive reaction counts" 


      it "sets the surrogate key header equal to params" 


      it "sets Fastly cache control and surrogate control headers" 

    end
  end

  describe "POST /reactions" do
    let(:valid_params) do
      {
        reactable_id: article.id,
        reactable_type: "Article",
        category: "like"
      }
    end

    before do
      sign_in user
      post "/reactions", params: valid_params
    end

    it "creates reaction" 


    it "destroys existing reaction" 

  end
end

