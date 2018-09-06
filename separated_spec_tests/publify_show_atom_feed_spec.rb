require 'rails_helper'

describe 'authors/show_atom_feed.atom.builder', type: :view do
  let!(:blog) { create(:blog) }
  let(:author) { create :user }
  let(:parsed_feed) { Feedjira::Feed.parse(rendered) }

  describe 'with no items' do
    before(:each) do
      assign(:author, author)
      assign(:articles, [])
      render
    end

    it 'renders the atom header partial' 


    it 'links to the author url' 

  end

  describe 'rendering articles (with some funny characters)' do
    before(:each) do
      article1 = stub_full_article(1.minute.ago)
      article1.body = '&eacute;coute!'
      article2 = stub_full_article(2.minutes.ago)
      article2.body = 'is 4 < 2? no!'
      assign(:author, author)
      assign(:articles, [article1, article2])
      render
    end

    it 'creates a valid atom feed with two items' 


    it 'renders the article atom partial twice' 

  end
end

