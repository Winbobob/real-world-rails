# frozen_string_literal: true

require 'rails_helper'

# Test article rendering for installed themes
RSpec.describe ArticlesController, type: :controller do
  render_views

  let(:blog) { create :blog }

  with_each_theme do |theme, _view_path|
    context "with theme #{theme}" do
      before do
        blog.theme = theme
        blog.save!
      end

      describe '#redirect' do
        let(:article) { create :article }
        let(:from_param) { article.permalink_url.sub(%r{#{blog.base_url}/}, '') }

        it 'successfully renders an article' 


        context 'when the article has an excerpt' do
          let(:article) { create :article, excerpt: 'foo', body: 'bar' }

          it 'does not render a continue reading link' 

        end

        describe 'accessing an article' do
          let!(:article) { create(:article) }

          before do
            get :redirect, params: { from: from_param }
          end

          it 'has good rss feed link' 


          it 'has good atom feed link' 


          it 'has a canonical url' 


          it 'has a good title' 

        end

        describe 'theme rendering' do
          let!(:article) { create(:article) }

          it 'renders without errors when no comments or trackbacks are present' 


          it 'renders without errors when recaptcha is enabled' 


          it 'renders without errors when comments and trackbacks are present' 

        end

        context 'when the article is password protected' do
          let(:article) { create(:article, password: 'password') }

          it 'article alone should be password protected' 

        end
      end

      describe '#index' do
        let!(:user) { create :user }

        context 'without any parameters' do
          let!(:article) { create(:article) }
          let!(:note) { create(:note) }

          before do
            get :index
          end

          it 'has good link feed rss' 


          it 'has good link feed atom' 


          it 'has a canonical url' 


          it 'has good title' 

        end

        context 'when an article has an excerpt' do
          let!(:article) { create :article, excerpt: 'foo', body: 'bar' }

          it 'renders a continue reading link' 

        end

        context 'when requesting archives for a month' do
          before do
            create(:article, published_at: Time.utc(2004, 4, 23))
            get 'index', params: { year: 2004, month: 4 }
          end

          it 'has a canonical url' 


          it 'has a good title' 

        end
      end

      describe '#search' do
        let!(:user) { create :user }

        before do
          create(:article, body: "in markdown format\n\n * we\n * use\n [ok](http://blog.ok.com) to define a link", text_filter: create(:markdown))
          create(:article, body: 'xyz')
          get :search, params: { q: 'a' }
        end

        it 'has good feed rss link' 


        it 'has good feed atom link' 


        it 'has a canonical url' 


        it 'has a good title' 


        it 'has content markdown interpret and without html tag' 

      end

      describe '#livesearch' do
        before do
          create(:article, body: 'hello world and im herer')
          create(:article, title: 'hello', body: 'worldwide')
          create(:article)
          get :live_search, params: { q: 'hello world' }
        end

        it 'does not have h3 tag' 

      end

      describe '#archives' do
        context 'with several articles' do
          let!(:articles) { create_list :article, 3 }

          before do
            get 'archives'
          end

          it 'has the correct self-link and title' 


          it 'shows the current month only once' 

        end

        context 'with an article with tags' do
          it 'renders correctly' 

        end
      end

      describe '#preview' do
        context 'with logged user' do
          let(:admin) { create(:user, :as_admin) }
          let(:article) { create(:article, user: admin) }

          before do
            sign_in admin
          end

          it 'renders the regular read template' 


          context 'when the article has an excerpt' do
            let(:article) { create :article, excerpt: 'foo', body: 'bar', user: admin }

            it 'does not render a continue reading link' 

          end
        end
      end

      describe '#check_password' do
        let!(:article) { create(:article, password: 'password') }

        it 'shows article when given correct password' 


        it 'shows password form when given incorrect password' 

      end
    end
  end
end

