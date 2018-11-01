require 'rails_helper'

describe API::Snippets do
  let!(:user) { create(:user) }

  describe 'GET /snippets/' do
    it 'returns snippets available' 


    it 'hides private snippets from regular user' 


    it 'returns 404 for non-authenticated' 


    it 'does not return snippets related to a project with disable feature visibility' 

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

  describe 'GET /snippets/:id' do
    let(:snippet) { create(:personal_snippet, author: user) }

    it 'returns snippet json' 


    it 'returns 404 for invalid snippet id' 

  end

  describe 'POST /snippets/' do
    let(:params) do
      {
        title: 'Test Title',
        file_name: 'test.rb',
        description: 'test description',
        content: 'puts "hello world"',
        visibility: 'public'
      }
    end

    it 'creates a new snippet' 


    it 'returns 400 for missing parameters' 


    context 'when the snippet is spam' do
      def create_snippet(snippet_params = {})
        post api('/snippets', user), params.merge(snippet_params)
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
    let(:visibility_level) { Snippet::PUBLIC }
    let(:other_user) { create(:user) }
    let(:snippet) do
      create(:personal_snippet, author: user, visibility_level: visibility_level)
    end

    it 'updates snippet' 


    it 'returns 404 for invalid snippet id' 


    it "returns 404 for another user's snippet" 


    it 'returns 400 for missing parameters' 


    context 'when the snippet is spam' do
      def update_snippet(snippet_params = {})
        put api("/snippets/#{snippet.id}", user), snippet_params
      end

      before do
        allow_any_instance_of(AkismetService).to receive(:spam?).and_return(true)
      end

      context 'when the snippet is private' do
        let(:visibility_level) { Snippet::PRIVATE }

        it 'updates the snippet' 

      end

      context 'when the snippet is public' do
        let(:visibility_level) { Snippet::PUBLIC }

        it 'rejects the shippet' 


        it 'creates a spam log' 

      end

      context 'when a private snippet is made public' do
        let(:visibility_level) { Snippet::PRIVATE }

        it 'rejects the snippet' 


        it 'creates a spam log' 

      end
    end
  end

  describe 'DELETE /snippets/:id' do
    let!(:public_snippet) { create(:personal_snippet, :public, author: user) }
    it 'deletes snippet' 


    it 'returns 404 for invalid snippet id' 


    it_behaves_like '412 response' do
      let(:request) { api("/snippets/#{public_snippet.id}", user) }
    end
  end

  describe "GET /snippets/:id/user_agent_detail" do
    let(:admin) { create(:admin) }
    let(:snippet) { create(:personal_snippet, :public, author: user) }
    let!(:user_agent_detail) { create(:user_agent_detail, subject: snippet) }

    it 'exposes known attributes' 


    it "returns unauthorized for non-admin users" 

  end
end

