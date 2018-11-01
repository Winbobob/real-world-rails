require "rails_helper"

RSpec.describe "Comments", type: :request do
  let(:user) { create(:user) }
  let(:article) { create(:article, user_id: user.id) }
  let(:podcast) { create(:podcast) }
  let(:podcast_episode) { create(:podcast_episode, podcast_id: podcast.id) }
  let(:comment) do
    create(:comment,
           commentable_id: article.id,
           commentable_type: "Article",
           user_id: user.id)
  end
  let(:podcast_comment) do
    create(:comment,
           commentable_id: podcast_episode.id,
           commentable_type: "PodcastEpisode",
           user_id: user.id)
  end

  describe "GET comment index" do
    it "returns 200" 


    it "displays a comment" 


    context "when the comment is for a podcast's episode" do
      it "works" 

    end

    context "when the article is unpublished" do
      before do
        new_markdown = article.body_markdown.gsub("published: true", "published: false")
        comment
        article.update(body_markdown: new_markdown)
      end

      it "raises a Not Found error" 

    end
  end

  describe "GET /:username/:slug/comments/:id_code/edit" do
    context "when not logged-in" do
      it "returns unauthorized error" 

    end

    context "when logged-in" do
      before do
        login_as user
      end

      it "returns 200" 


      it "returns the comment" 

    end
  end

  describe "POST /comments/preview" do
    it "returns 401 if user is not logged in" 


    context "when logged-in" do
      before do
        login_as user
        post "/comments/preview",
          params: { comment: { body_markdown: "hi" } },
          headers: { HTTP_ACCEPT: "application/json" }
      end

      it "returns 200 on good request" 


      it "returns json" 

    end
  end
end

