# frozen_string_literal: true

require 'rails_helper'

describe Admin::ContentController, type: :controller do
  render_views

  let(:admin) { create(:user, :as_admin, text_filter: create(:markdown)) }
  let(:publisher) { create(:user, :as_publisher, text_filter: create(:markdown)) }
  let(:contributor) { create(:user, :as_contributor) }

  before do
    create :blog
  end

  describe 'index' do
    let!(:article) { create(:article) }

    before do
      sign_in publisher
    end

    context 'simple query' do
      before { get :index }

      it { expect(response).to be_successful }
      it { expect(response).to render_template('index', layout: 'administration') }
    end

    it 'return article that match with search query' 


    it 'search query and limit on published_at' 


    context 'search for state' do
      let!(:draft_article) { create(:article, state: 'draft') }
      let!(:pending_article) { create(:article, state: 'publication_pending', published_at: '2020-01-01') }

      before { get :index, params: { search: state } }

      context 'draft only' do
        let(:state) { { state: 'drafts' } }

        it { expect(assigns(:articles)).to eq([draft_article]) }
      end

      context 'publication_pending only' do
        let(:state) { { state: 'pending' } }

        it { expect(assigns(:articles)).to eq([pending_article]) }
      end

      context 'with a bad state' do
        let(:state) { { state: '3vI1 1337 h4x0r' } }

        it { expect(assigns(:articles).sort).to eq([article, pending_article, draft_article].sort) }
      end
    end
  end

  describe '#autosave' do
    before do
      sign_in publisher
    end

    context 'first time save' do
      it 'creates a new draft Article' 


      it 'creates tags for the draft article if relevant' 

    end

    context 'second call to save' do
      let!(:draft) { create(:article, state: 'draft') }

      it 'does not create an extra draft' 

    end

    context 'with an other existing draft' do
      let!(:draft) { create(:article, state: 'draft', body: 'existing body') }

      it 'creates a new draft Article' 


      it 'does not replace existing draft' 

    end
  end

  describe '#new' do
    before do
      sign_in publisher
      get :new
    end

    it { expect(response).to be_successful }
    it { expect(response).to render_template('new') }
    it { expect(assigns(:article)).not_to be_nil }
    it { expect(assigns(:article).redirect).to be_nil }
  end

  describe '#create' do
    shared_examples_for 'create action' do
      def base_article(options = {})
        { title: 'posted via tests!',
          body: 'A good body',
          allow_comments: '1',
          allow_pings: '1' }.merge(options)
      end

      it 'sends notifications on create' 


      it 'creates an article with tags' 


      it 'creates an article with a unique Tag instance named lang:FR' 


      it 'correctlies interpret time zone in :published_at' 


      it 'respects "GMT+0000 (UTC)" in :published_at' 


      it 'creates a filtered article' 


      context 'with a previously autosaved draft' do
        before do
          @draft = create(:article, body: 'draft', state: 'draft')
          post :create, params: { article: { id: @draft.id, body: 'update', published: true } }
        end

        it 'updates the draft' 


        it 'makes the draft published' 

      end

      describe 'with an unrelated draft in the database' do
        before do
          @draft = create(:article, state: 'draft')
        end

        describe 'saving new article as draft' do
          it 'leaves the original draft in existence' 

        end
      end
    end

    context 'as a publisher' do
      before do
        sign_in publisher
        @user = publisher
      end

      let(:article_params) { { title: 'posted via tests!', body: 'a good boy' } }

      it 'creates an article' 


      context 'classic' do
        before { post :create, params: { article: article_params } }

        it { expect(response).to redirect_to(action: :index) }
        it { expect(flash[:success]).to eq(I18n.t('admin.content.create.success')) }

        it { expect(assigns(:article)).to be_published }
        it { expect(assigns(:article).user).to eq(publisher) }

        context 'when doing a draft' do
          let(:article_params) { { title: 'posted via tests!', body: 'a good boy', draft: 'true' } }

          it { expect(assigns(:article)).not_to be_published }
        end
      end

      context 'writing for the future' do
        let(:article_params) do
          { title: 'posted via tests!', body: 'a good boy', published_at: 1.hour.from_now.to_s }
        end

        before do
          post :create, params: { article: article_params }
        end

        it 'does not create a short url' 


        it 'creates a trigger to publish the article' 


        it 'does not publish the article' 


        it 'sets the publication time in the future' 

      end
    end

    context 'as an admin' do
      before do
        sign_in admin
        @user = admin
      end

      it_behaves_like 'create action'
    end
  end

  describe '#edit' do
    context 'as an admin' do
      let(:article) { create(:article) }

      before do
        sign_in admin
      end

      it 'edits article' 


      it 'correctly converts multi-word tags' 

    end

    context 'as a publisher' do
      before do
        sign_in publisher
      end

      context 'with an article from an other user' do
        let(:article) { create(:article, user: create(:user, login: 'another_user')) }

        before { get :edit, params: { id: article.id } }

        it { expect(response).to redirect_to(action: 'index') }
      end

      context 'with an article from current user' do
        let(:article) { create(:article, user: publisher) }

        before { get :edit, params: { id: article.id } }

        it { expect(response).to render_template('edit') }
        it { expect(assigns(:article)).not_to be_nil }
        it { expect(assigns(:article)).to be_valid }
      end
    end
  end

  describe '#update' do
    context 'as an admin' do
      let(:article) { create(:article) }

      before do
        sign_in admin
      end

      it 'updates article' 


      it 'allows updating body_and_extended' 


      context 'when a published article has drafts' do
        let(:original_published_at) { 2.days.ago.to_date }
        let!(:original) { create(:article, published_at: original_published_at) }
        let!(:draft) { create(:article, parent_id: original.id, state: 'draft') }
        let!(:second_draft) { create(:article, parent_id: original.id, state: 'draft') }

        describe 'publishing the published article' do
          before do
            put(:update, params: {
                  id: original.id,
                  article: { id: draft.id, body: 'update' }
                })
          end

          it 'updates the article' 


          it 'deletes all drafts' 


          it 'keeps the original publication date' 

        end

        describe 'publishing a draft copy of the published article' do
          before do
            put(:update, params: {
                  id: draft.id,
                  article: { id: draft.id, body: 'update' }
                })
          end

          it 'updates the original' 


          it 'deletes all drafts' 


          it 'keeps the original publication date' 

        end

        describe 'publishing a draft copy with a new publication date' do
          before do
            put(:update, params: {
                  id: draft.id,
                  article: { id: draft.id, body: 'update', published_at: '2016-07-07' }
                })
          end

          it 'updates the original publication date' 

        end
      end

      describe 'saving a published article as draft' do
        before do
          @orig = create(:article)
          put(:update, params: {
                id: @orig.id,
                article: { title: @orig.title, draft: 'draft', body: 'update' }
              })
        end

        it 'leaves the original published' 


        it 'leaves the original as is' 


        it 'redirects to the index' 


        it 'creates a draft' 

      end
    end

    context 'as a publisher' do
      before do
        sign_in publisher
      end

      context 'with an article' do
        let(:article) { create(:article, body: 'another *textile* test', user: publisher) }
        let(:body) { 'not the *same* text' }

        before do
          put :update, params: { id: article.id, article: { body: body, text_filter: 'textile' } }
        end

        it { expect(response).to redirect_to(action: 'index') }
        it { expect(article.reload.text_filter.name).to eq('textile') }
        it { expect(article.reload.body).to eq(body) }
      end
    end
  end

  describe '#auto_complete_for_article_keywords' do
    before do
      sign_in publisher
    end

    before do
      create(:tag, name: 'foo', contents: [create(:article)])
      create(:tag, name: 'bazz', contents: [create(:article)])
      create(:tag, name: 'bar', contents: [create(:article)])
    end

    it 'returns foo for keywords fo' 

  end

  describe '#destroy' do
    before do
      sign_in publisher
    end

    context 'with an article from other user' do
      let(:article) { create(:article, user: create(:user, login: 'other_user')) }

      before { delete :destroy, params: { id: article.id } }

      it { expect(response).to redirect_to(action: 'index') }
      it { expect(Article.count).to eq(1) }
    end

    context 'with an article from user' do
      let(:article) { create(:article, user: publisher) }

      before { delete :destroy, params: { id: article.id } }

      it { expect(response).to redirect_to(action: 'index') }
      it { expect(Article.count).to eq(0) }
    end
  end
end

