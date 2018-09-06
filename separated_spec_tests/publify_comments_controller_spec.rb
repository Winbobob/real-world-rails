require 'rails_helper'

describe CommentsController, type: :controller do
  let!(:blog) { create(:blog) }

  describe 'create' do
    describe 'Basic comment creation' do
      let(:article) { create(:article) }
      let(:comment) { { body: 'content', author: 'bob', email: 'bob@home', url: 'http://bobs.home/' } }

      before { post :create, params: { comment: comment, article_id: article.id } }

      it { expect(assigns[:comment]).to eq(Comment.find_by(author: 'bob', body: 'content', article_id: article.id)) }
      it { expect(assigns[:article]).to eq(article) }
      it { expect(article.comments.size).to eq(1) }
      it { expect(article.comments.last.author).to eq('bob') }
      it { expect(cookies['author']).to eq('bob') }
      it { expect(cookies['gravatar_id']).to eq(Digest::MD5.hexdigest('bob@home')) }
      it { expect(cookies['url']).to eq('http://bobs.home/') }
    end

    it 'should redirect to the article' 

  end

  describe 'AJAX creation' do
    it 'should render the comment partial' 

  end
end

