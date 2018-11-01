# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe '#tag' do
    let!(:blog) { create(:blog) }
    let!(:user) { create :user }

    it 'redirects to TagsContoller#index' 

  end

  describe '#index' do
    let!(:blog) { create(:blog) }
    let!(:user) { create :user }

    context 'without any parameters' do
      let!(:article) { create(:article) }
      let!(:note) { create(:note) }

      before do
        get :index
      end

      it { expect(response).to render_template(:index) }
      it { expect(assigns[:articles]).not_to be_empty }

      it 'has no meta keywords for a blog without keywords' 

    end

    context 'for a month' do
      before do
        create(:article, published_at: Time.utc(2004, 4, 23))
        get 'index', params: { year: 2004, month: 4 }
      end

      it 'renders template index' 


      it 'contains some articles' 

    end

    context 'for feeds' do
      let!(:article1) { create(:article, created_at: 1.day.ago) }
      let!(:article2) { create(:article, published_at: '2004-04-01 12:00:00') }

      let(:trackback) { create(:trackback, article: article1, published_at: 1.day.ago) }

      specify '/articles.atom => an atom feed' do
        get 'index', params: { format: 'atom' }
        expect(response).to be_successful
        expect(response).to render_template('index_atom_feed', layout: false)
        expect(assigns(:articles)).to eq([article1, article2])
      end

      specify '/articles.rss => an RSS 2.0 feed' do
        get 'index', params: { format: 'rss' }
        expect(response).to be_successful
        expect(response).to render_template('index_rss_feed', layout: false)
        expect(assigns(:articles)).to eq([article1, article2])
      end

      specify 'atom feed for archive should be valid' do
        get 'index', params: { year: 2004, month: 4, format: 'atom' }
        expect(response).to render_template('index_atom_feed', layout: false)
        expect(assigns(:articles)).to eq([article2])
      end

      specify 'RSS feed for archive should be valid' do
        get 'index', params: { year: 2004, month: 4, format: 'rss' }
        expect(response).to render_template('index_rss_feed', layout: false)
        expect(assigns(:articles)).to eq([article2])
      end
    end

    context 'with an accept header' do
      before do
        create(:article)
      end

      it 'ignores the HTTP Accept: header' 

    end

    context "with blog meta keywords to 'publify, is, amazing'" do
      let!(:blog) { create(:blog, meta_keywords: 'publify, is, amazing') }

      it 'index without option but with blog keywords should have meta keywords' 

    end

    context 'when blog settings is empty' do
      let!(:blog) { create(:blog, settings: {}) }

      it 'redirects to setup' 

    end

    context 'when there are no users' do
      before do
        User.destroy_all
      end

      it 'redirects to signup' 

    end
  end

  describe '#search' do
    let!(:blog) { create(:blog) }
    let!(:user) { create :user }

    before do
      create(:article, body: "in markdown format\n\n * we\n * use\n [ok](http://blog.ok.com) to define a link", text_filter: create(:markdown))
      create(:article, body: 'xyz')
    end

    describe 'a valid search' do
      before { get :search, params: { q: 'a' } }

      it { expect(response).to render_template(:search) }
      it { expect(assigns[:articles]).not_to be_nil }
    end

    it 'renders feed rss by search' 


    it 'renders feed atom by search' 


    it 'search with empty result' 

  end

  describe '#livesearch' do
    context 'with a query with several words' do
      before do
        create(:article, body: 'hello world and im herer')
        create(:article, title: 'hello', body: 'worldwide')
        create(:article)
        get :live_search, params: { q: 'hello world' }
      end

      it 'is valid' 


      it 'renders without layout' 


      it 'renders template live_search' 


      it 'assigns @search the search string' 

    end
  end

  describe '#archives' do
    let(:blog) { create :blog }

    context 'for an archive with several articles' do
      let!(:articles) { create_list :article, 3 }

      before do
        get 'archives'
      end

      it 'renders the correct template' 


      it 'assigns the articles' 

    end
  end

  describe '#preview' do
    let!(:blog) { create(:blog) }

    context 'with non logged user' do
      before do
        get :preview, params: { id: create(:article).id }
      end

      it 'redirects to login' 

    end

    context 'with logged user' do
      let(:admin) { create(:user, :as_admin) }
      let(:article) { create(:article, user: admin) }

      before do
        sign_in admin
      end

      it 'assignes article define with id' 


      it 'assignes last article with id like parent_id' 

    end
  end

  describe '#redirect' do
    describe 'with explicit redirects' do
      describe 'with empty relative_url_root' do
        it 'redirects from known URL' 


        it 'does not redirect from unknown URL' 

      end

      # FIXME: Due to the changes in Rails 3 (no relative_url_root), this
      # does not work anymore when the accessed URL does not match the blog's
      # base_url at least partly. Do we still want to allow acces to the blog
      # through non-standard URLs? What was the original purpose of these
      # redirects?
      describe 'and non-empty relative_url_root' do
        before do
          create(:blog, base_url: 'http://test.host/blog')
          create(:user)
        end

        it 'redirects' 


        it 'redirects if to_path includes relative_url_root' 


        it 'ignores the blog base_url if the to_path is a full uri' 

      end
    end

    it 'gets good article with utf8 slug' 


    # NOTE: This is needed because Rails over-unescapes glob parameters.
    it 'gets good article with pre-escaped utf8 slug using unescaped slug' 


    describe 'accessing old-style URL with "articles" as the first part' do
      it 'redirects to article without url_root' 


      it 'redirects to article with url_root' 


      it 'redirects to article with articles in url_root' 


      it 'should not redirect to an article from another blog'
    end

    describe 'with permalink_format like %title%.html' do
      let!(:blog) { create(:blog, permalink_format: '/%title%.html') }
      let!(:admin) { create(:user, :as_admin) }

      before do
        sign_in admin
      end

      context 'with an article' do
        let!(:article) { create(:article, permalink: 'second-blog-article', published_at: Time.utc(2004, 4, 1)) }

        context 'try redirect to an unknown location' do
          it 'raises RecordNotFound' 

        end

        describe 'accessing legacy URLs' do
          it 'redirects from default URL format' 


          it 'redirects from old-style URL format with "articles" part' 

        end
      end

      describe 'accessing an article' do
        let!(:article) { create(:article, permalink: 'second-blog-article', published_at: Time.utc(2004, 4, 1)) }

        before do
          get :redirect, params: { from: "#{article.permalink}.html" }
        end

        it 'renders template read to article' 


        it 'assigns article1 to @article' 


        it 'article without tags should not have meta keywords' 

      end

      describe 'rendering as atom feed' do
        let!(:article) { create(:article, permalink: 'second-blog-article', published_at: Time.utc(2004, 4, 1)) }
        let!(:trackback1) { create(:trackback, article: article, created_at: 1.day.ago) }

        before do
          get :redirect, params: { from: "#{article.permalink}.html.atom" }
        end

        it 'renders feedback atom feed for the article' 

      end

      describe 'rendering as rss feed' do
        let!(:article) { create(:article, permalink: 'second-blog-article', published_at: Time.utc(2004, 4, 1)) }
        let!(:trackback1) { create(:trackback, article: article, created_at: 1.day.ago) }

        before do
          get :redirect, params: { from: "#{article.permalink}.html.rss" }
        end

        it 'renders feedback rss feed for the article' 

      end
    end

    describe 'with a format containing a fixed component' do
      let!(:blog) { create(:blog, permalink_format: '/foo/%title%') }
      let!(:article) { create(:article) }

      it 'finds the article if the url matches all components' 


      it 'does not find the article if the url does not match the fixed component' 

    end
  end
end

