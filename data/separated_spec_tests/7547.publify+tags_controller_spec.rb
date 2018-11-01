# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  describe '#index' do
    before do
      create(:blog)
      @tag = create(:tag)
      @tag.contents << create(:article)
    end

    describe 'normally' do
      before do
        get 'index'
      end

      specify { expect(response).to be_successful }
      specify { expect(response).to render_template('tags/index') }
      specify { expect(assigns(:tags)).to match_array([@tag]) }
    end
  end

  describe 'showing a single tag' do
    before do
      create(:blog)
      @tag = create(:tag, name: 'Foo')
    end

    def do_get
      get 'show', params: { id: 'foo' }
    end

    describe 'with some articles' do
      before do
        @articles = create_list :article, 2
        @tag.contents << @articles
      end

      it 'is successful' 


      it 'retrieves the correct set of articles' 


      it 'renders :show by default' 


      it 'renders the tag template if present' 


      it 'assigns the correct page title' 


      it 'assigns the correct description' 


      it 'renders the atom feed for /articles/tag/foo.atom' 


      it 'renders the rss feed for /articles/tag/foo.rss' 

    end

    describe 'without articles' do
      it 'raises RecordNotFound' 

    end
  end

  describe 'showing a non-existant tag' do
    it 'signals not found' 

  end

  describe 'SEO Options' do
    before do
      @blog = create(:blog)
      @a = create(:article)
      @foo = create(:tag, name: 'foo', contents: [@a])
    end

    describe 'keywords' do
      it 'does not assign keywords when the blog has no keywords' 


      it "assigns the blog's keywords if present" 

    end
  end
end

