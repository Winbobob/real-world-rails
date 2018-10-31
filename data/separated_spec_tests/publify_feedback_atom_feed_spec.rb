require 'rails_helper'

describe 'articles/feedback_atom_feed.atom.builder', type: :view do
  let(:article) { create :article }
  let(:parsed_feed) { Feedjira::Feed.parse(rendered) }

  describe 'with one trackback' do
    let!(:trackback) { create(:trackback, article: article) }

    before(:each) do
      assign(:article, article)
      render
    end

    it 'renders a valid Atom feed with one item' 


    describe 'the trackback entry' do
      it 'should have all the required attributes' 

    end

    it 'links to the article url' 

  end

  describe 'with a comment with problematic characters' do
    let!(:comment) { create(:comment, article: article, body: '&eacute;coute! 4 < 2, non?') }

    before(:each) do
      assign(:article, article)
      render
    end

    it 'renders a valid Atom feed with one item' 

  end
end

