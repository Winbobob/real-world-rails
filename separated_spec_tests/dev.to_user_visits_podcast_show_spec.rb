require "rails_helper"

describe "User visits podcast show page" do
  let(:podcast) { create(:podcast) }
  let(:podcast_episode) { create(:podcast_episode, podcast_id: podcast.id) }
  let(:user) { create(:user) }
  let(:comment) do
    create(:comment, user_id: user.id,
                     commentable_id: podcast_episode.id,
                     commentable_type: "Article")
  end
  let(:comment2) do
    create(:comment,
                              user_id: user.id,
                              commentable_id: article.id,
                              parent_id: podcast_episode.id,
                              commentable_type: "Article")
  end

  it "they see the content of the hero" 

  it "see the new comment box on the page" 

  # scenario 'see comments on the page' do
  #   visit "#{podcast_episode.path}"
  #   expect(page).to have_css '#comment-node-'+comment.id
  # end
end

