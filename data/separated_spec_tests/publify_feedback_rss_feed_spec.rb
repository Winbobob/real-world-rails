require 'rails_helper'

describe 'articles/feedback_rss_feed.rss.builder', type: :view do
  let(:article) { create :article }

  describe 'with feedback consisting of one trackback and one comment' do
    let!(:trackback) { create(:trackback, article: article) }
    let!(:comment) { create(:comment, article: article, body: 'Comment body') }
    let(:parsed_feed) { Feedjira::Feed.parse(rendered) }

    before(:each) do
      assign(:article, article)
      render
    end

    it 'renders a valid RSS feed with two items' 


    it 'renders the correct RSS partials' 


    it 'links to the article url' 

  end
end

