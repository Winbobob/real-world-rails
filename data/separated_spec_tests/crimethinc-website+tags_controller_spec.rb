require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  describe 'GET #show' do
    let(:status) { create(:status, :published) }

    it 'renders on a tag with articles' 


    it 'redirects on an empty tag' 

  end

  # TODO: update for new style tagging
  # describe 'GET #feed' do
  #   it 'renders on a tag with articles' do
  #     article = Article.create(title: 'Test', published_at: 1.day.ago)
  #     # article.save_tags!('Test Tag') TODO add new spec for saving tags
  #     tag = Tag.last
  #
  #     get :feed, params: {slug: tag.slug}
  #
  #     expect(response).to be_successful
  #   end
  # end
end

