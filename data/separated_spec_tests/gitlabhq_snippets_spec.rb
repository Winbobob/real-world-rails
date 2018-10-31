require 'rails_helper'

describe API::V3::Snippets do
  let!(:user) { create(:user) }

  describe 'GET /snippets/' do
    it 'returns snippets available' 


    it 'hides private snippets from regular user' 

  end

  describe 'GET /snippets/public' do
    let!(:other_user) { create(:user) }
    let!(:public_snippet) { create(:personal_snippet, :public, author: user) }
    let!(:private_snippet) { create(:personal_snippet, :private, author: user) }
    let!(:internal_snippet) { create(:personal_snippet, :internal, author: user) }
    let!(:public_snippet_other) { create(:personal_snippet, :public, author: other_user) }
    let!(:private_snippet_other) { create(:personal_snippet, :private, author: other_user) }
    let!(:internal_snippet_other) { create(:personal_snippet, :internal, author: other_user) }

    it 'returns all snippets with public visibility from all users' 

  end

  describe 'GET /snippets/:id/raw' do
    let(:snippet) { create(:personal_snippet, author: user) }

    it 'returns raw text' 


    it 'returns 404 for invalid snippet id' 

  end

  describe 'POST /snippets/' do
    let(:params) do
      {
        title: 'Test Title',
        file_name: 'test.rb',
        content: 'puts "hello world"',
        visibility_level: Snippet::PUBLIC
      }
    end

    it 'creates a new snippet' 


    it 'returns 400 for missing parameters' 


    context 'when the snippet is spam' do
      def create_snippet(snippet_params = {})
        post v3_api('/snippets', user), params.merge(snippet_params)
      end

      before do
        allow_any_instance_of(AkismetService).to receive(:spam?).and_return(true)
      end

      context 'when the snippet is private' do
        it 'creates the snippet' 

      end

      context 'when the snippet is public' do
        it 'rejects the shippet' 


        it 'creates a spam log' 

      end
    end
  end

  describe 'PUT /snippets/:id' do
    let(:other_user) { create(:user) }
    let(:public_snippet) { create(:personal_snippet, :public, author: user) }
    it 'updates snippet' 


    it 'returns 404 for invalid snippet id' 


    it "returns 404 for another user's snippet" 


    it 'returns 400 for missing parameters' 

  end

  describe 'DELETE /snippets/:id' do
    let!(:public_snippet) { create(:personal_snippet, :public, author: user) }
    it 'deletes snippet' 


    it 'returns 404 for invalid snippet id' 

  end
end

