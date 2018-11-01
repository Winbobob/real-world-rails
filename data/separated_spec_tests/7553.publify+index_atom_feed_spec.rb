# frozen_string_literal: true

require 'rails_helper'

describe 'articles/index_atom_feed.atom.builder', type: :view do
  let(:parsed_feed) { Feedjira::Feed.parse(rendered) }
  let(:rendered_entry) { parsed_feed.entries.first }

  describe 'with no items' do
    before do
      assign(:articles, [])
      render
    end

    it 'renders the atom header partial' 

  end

  describe 'rendering articles (with some funny characters)' do
    let!(:blog) { create :blog }

    before do
      article1 = create :full_article, published_at: 1.minute.ago
      article1.body = '&eacute;coute!'
      article2 = create :full_article, published_at: 2.minutes.ago
      article2.body = 'is 4 < 2? no!'
      assign(:articles, [article1, article2])
      render
    end

    it 'creates a valid atom feed with two items' 


    it 'renders the article atom partial twice' 


    it 'links to the main blog url' 

  end

  describe 'rendering a single article' do
    let(:blog) { create :blog }

    before do
      @article = create :full_article, blog: blog
      @article.body = 'public info'
      @article.extended = 'and more'
      @article.published_at = 2.weeks.ago
      assign(:articles, [@article])
    end

    it 'has the correct guid' 


    it 'has the correct publication date' 


    describe 'on a blog that shows extended content in feeds' do
      let(:blog) { create :blog, hide_extended_on_rss: false }

      before do
        render
      end

      it 'shows the body and extended content in the feed' 


      it 'does not have a summary element in addition to the content element' 

    end

    describe 'on a blog that hides extended content in feeds' do
      let(:blog) { create :blog, hide_extended_on_rss: true }

      it 'shows only the body content in the feed if there is no excerpt' 


      it 'shows the excerpt instead of the body content in the feed, if there is an excerpt' 


      it 'does not have a summary element in addition to the content element' 

    end

    describe 'on a blog that has an RSS description set' do
      let(:blog) do
        create :blog, rss_description: true,
                      rss_description_text: 'rss description'
      end

      before do
        render
      end

      it 'shows the body content in the feed' 


      it 'shows the RSS description in the feed' 

    end
  end

  describe 'rendering a password protected article' do
    before do
      @article = create :full_article, blog: blog
      @article.body = "shh .. it's a secret!"
      @article.extended = 'even more secret!'
      allow(@article).to receive(:password).and_return('password')
      assign(:articles, [@article])
      render
    end

    describe 'on a blog that shows extended content in feeds' do
      let(:blog) { create :blog, hide_extended_on_rss: false }

      it 'shows only a link to the article' 


      it 'does not have a summary element in addition to the content element' 


      it 'does not show any secret bits anywhere' 

    end

    describe 'on a blog that hides extended content in feeds' do
      let(:blog) { create :blog, hide_extended_on_rss: true }

      it 'shows only a link to the article' 


      it 'does not have a summary element in addition to the content element' 


      it 'does not show any secret bits anywhere' 

    end
  end

  describe '#title' do
    before do
      assign(:articles, [article])
      render
    end

    context 'with a note' do
      let(:article) { create(:note) }

      it 'is equal to the note body' 

    end

    context 'with an article' do
      let(:article) { create(:article) }

      it 'is equal to the article title' 

    end
  end
end

