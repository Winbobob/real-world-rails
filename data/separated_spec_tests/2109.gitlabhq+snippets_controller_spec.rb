require 'spec_helper'

describe Projects::SnippetsController do
  let(:project) { create(:project_empty_repo, :public) }
  let(:user)    { create(:user) }
  let(:user2)   { create(:user) }

  before do
    project.add_maintainer(user)
    project.add_maintainer(user2)
  end

  describe 'GET #index' do
    context 'when page param' do
      let(:last_page) { project.snippets.page().total_pages }
      let!(:project_snippet) { create(:project_snippet, :public, project: project, author: user) }

      it 'redirects to last_page if page number is larger than number of pages' 


      it 'redirects to specified page' 

    end

    context 'when the project snippet is private' do
      let!(:project_snippet) { create(:project_snippet, :private, project: project, author: user) }

      context 'when anonymous' do
        it 'does not include the private snippet' 

      end

      context 'when signed in as the author' do
        before do
          sign_in(user)
        end

        it 'renders the snippet' 

      end

      context 'when signed in as a project member' do
        before do
          sign_in(user2)
        end

        it 'renders the snippet' 

      end
    end
  end

  describe 'POST #create' do
    def create_snippet(project, snippet_params = {}, additional_params = {})
      sign_in(user)

      project.add_developer(user)

      post :create, {
        namespace_id: project.namespace.to_param,
        project_id: project,
        project_snippet: { title: 'Title', content: 'Content', description: 'Description' }.merge(snippet_params)
      }.merge(additional_params)

      Snippet.last
    end

    it 'creates the snippet correctly' 


    context 'when the snippet is spam' do
      before do
        allow_any_instance_of(AkismetService).to receive(:spam?).and_return(true)
      end

      context 'when the snippet is private' do
        it 'creates the snippet' 

      end

      context 'when the snippet is public' do
        it 'rejects the shippet' 


        it 'creates a spam log' 


        it 'renders :new with recaptcha disabled' 


        context 'recaptcha enabled' do
          before do
            stub_application_setting(recaptcha_enabled: true)
          end

          it 'renders :verify with recaptcha enabled' 


          it 'renders snippet page when recaptcha verified' 

        end
      end
    end
  end

  describe 'PUT #update' do
    let(:project) { create :project, :public }
    let(:snippet) { create :project_snippet, author: user, project: project, visibility_level: visibility_level }

    def update_snippet(snippet_params = {}, additional_params = {})
      sign_in(user)

      project.add_developer(user)

      put :update, {
        namespace_id: project.namespace.to_param,
        project_id: project,
        id: snippet.id,
        project_snippet: { title: 'Title', content: 'Content' }.merge(snippet_params)
      }.merge(additional_params)

      snippet.reload
    end

    context 'when the snippet is spam' do
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


        it 'renders :edit with recaptcha disabled' 


        context 'recaptcha enabled' do
          before do
            stub_application_setting(recaptcha_enabled: true)
          end

          it 'renders :verify with recaptcha enabled' 


          it 'renders snippet page when recaptcha verified' 

        end
      end

      context 'when the private snippet is made public' do
        let(:visibility_level) { Snippet::PRIVATE }

        it 'rejects the shippet' 


        it 'creates a spam log' 


        it 'renders :edit with recaptcha disabled' 


        context 'recaptcha enabled' do
          before do
            stub_application_setting(recaptcha_enabled: true)
          end

          it 'renders :verify with recaptcha enabled' 


          it 'renders snippet page when recaptcha verified' 

        end
      end
    end
  end

  describe 'POST #mark_as_spam' do
    let(:snippet) { create(:project_snippet, :private, project: project, author: user) }

    before do
      allow_any_instance_of(AkismetService).to receive_messages(submit_spam: true)
      stub_application_setting(akismet_enabled: true)
    end

    def mark_as_spam
      admin = create(:admin)
      create(:user_agent_detail, subject: snippet)
      project.add_maintainer(admin)
      sign_in(admin)

      post :mark_as_spam,
           namespace_id: project.namespace,
           project_id: project,
           id: snippet.id
    end

    it 'updates the snippet' 

  end

  %w[show raw].each do |action|
    describe "GET ##{action}" do
      context 'when the project snippet is private' do
        let(:project_snippet) { create(:project_snippet, :private, project: project, author: user) }

        context 'when anonymous' do
          it 'responds with status 404' 

        end

        context 'when signed in as the author' do
          before do
            sign_in(user)
          end

          it 'renders the snippet' 

        end

        context 'when signed in as a project member' do
          before do
            sign_in(user2)
          end

          it 'renders the snippet' 

        end
      end

      context 'when the project snippet does not exist' do
        context 'when anonymous' do
          it 'responds with status 404' 

        end

        context 'when signed in' do
          before do
            sign_in(user)
          end

          it 'responds with status 404' 

        end
      end
    end
  end

  describe 'GET #raw' do
    let(:project_snippet) do
      create(
        :project_snippet, :public,
        project: project,
        author: user,
        content: "first line\r\nsecond line\r\nthird line"
      )
    end

    context 'CRLF line ending' do
      let(:params) do
        {
          namespace_id: project.namespace,
          project_id: project,
          id: project_snippet.to_param
        }
      end

      it 'returns LF line endings by default' 


      it 'does not convert line endings when parameter present' 

    end
  end
end

