require 'rails_helper'

describe API::ProjectSnippets do
  set(:project) { create(:project, :public) }
  set(:user) { create(:user) }
  set(:admin) { create(:admin) }

  describe "GET /projects/:project_id/snippets/:id/user_agent_detail" do
    let(:snippet) { create(:project_snippet, :public, project: project) }
    let!(:user_agent_detail) { create(:user_agent_detail, subject: snippet) }

    it 'exposes known attributes' 


    it 'respects project scoping' 


    it "returns unautorized for non-admin users" 

  end

  describe 'GET /projects/:project_id/snippets/' do
    let(:user) { create(:user) }

    it 'returns all snippets available to team member' 


    it 'hides private snippets from regular user' 

  end

  describe 'GET /projects/:project_id/snippets/:id' do
    let(:user) { create(:user) }
    let(:snippet) { create(:project_snippet, :public, project: project) }

    it 'returns snippet json' 


    it 'returns 404 for invalid snippet id' 

  end

  describe 'POST /projects/:project_id/snippets/' do
    let(:params) do
      {
        title: 'Test Title',
        file_name: 'test.rb',
        description: 'test description',
        code: 'puts "hello world"',
        visibility: 'public'
      }
    end

    it 'creates a new snippet' 


    it 'returns 400 for missing parameters' 


    context 'when the snippet is spam' do
      def create_snippet(project, snippet_params = {})
        project.add_developer(user)

        post api("/projects/#{project.id}/snippets", user), params.merge(snippet_params)
      end

      before do
        allow_any_instance_of(AkismetService).to receive(:spam?).and_return(true)
      end

      context 'when the snippet is private' do
        it 'creates the snippet' 

      end

      context 'when the snippet is public' do
        it 'rejects the snippet' 


        it 'creates a spam log' 

      end
    end
  end

  describe 'PUT /projects/:project_id/snippets/:id/' do
    let(:visibility_level) { Snippet::PUBLIC }
    let(:snippet) { create(:project_snippet, author: admin, visibility_level: visibility_level) }

    it 'updates snippet' 


    it 'returns 404 for invalid snippet id' 


    it 'returns 400 for missing parameters' 


    context 'when the snippet is spam' do
      def update_snippet(snippet_params = {})
        put api("/projects/#{snippet.project.id}/snippets/#{snippet.id}", admin), snippet_params
      end

      before do
        allow_any_instance_of(AkismetService).to receive(:spam?).and_return(true)
      end

      context 'when the snippet is private' do
        let(:visibility_level) { Snippet::PRIVATE }

        it 'creates the snippet' 

      end

      context 'when the snippet is public' do
        let(:visibility_level) { Snippet::PUBLIC }

        it 'rejects the snippet' 


        it 'creates a spam log' 

      end

      context 'when the private snippet is made public' do
        let(:visibility_level) { Snippet::PRIVATE }

        it 'rejects the snippet' 


        it 'creates a spam log' 

      end
    end
  end

  describe 'DELETE /projects/:project_id/snippets/:id/' do
    let(:snippet) { create(:project_snippet, author: admin) }

    it 'deletes snippet' 


    it 'returns 404 for invalid snippet id' 


    it_behaves_like '412 response' do
      let(:request) { api("/projects/#{snippet.project.id}/snippets/#{snippet.id}/", admin) }
    end
  end

  describe 'GET /projects/:project_id/snippets/:id/raw' do
    let(:snippet) { create(:project_snippet, author: admin) }

    it 'returns raw text' 


    it 'returns 404 for invalid snippet id' 

  end
end

