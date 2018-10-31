# frozen_string_literal: true

require 'rails_helper'

describe CommentsController, type: :controller do
  let!(:blog) { create(:blog) }
  let(:article) { create(:article) }
  let(:comment_params) do
    { body: 'content', author: 'bob', email: 'bob@home', url: 'http://bobs.home/' }
  end

  describe '#create' do
    context 'when using regular post' do
      before do
        post :create, params: { comment: comment_params, article_id: article.id }
      end

      it 'creates a comment on the specified article' 


      it 'remembers author info in cookies' 


      it 'redirects to the article' 

    end

    context 'when using xhr post' do
      before do
        post :create, xhr: true, params: { comment: comment_params, article_id: article.id }
      end

      it 'assigns the created comment for rendering' 


      it 'renders the comment partial' 

    end
  end

  describe '#preview' do
    context 'when using xhr post' do
      before do
        post :preview, xhr: true, params: { comment: comment_params, article_id: article.id }
      end

      it 'assigns a comment with the given parameters' 


      it 'assigns the article to the comment' 

    end
  end
end

