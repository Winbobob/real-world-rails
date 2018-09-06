require 'spec_helper'

describe Projects::Ci::LintsController do
  let(:project) { create(:project, :repository) }
  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe 'GET #show' do
    context 'with enough privileges' do
      before do
        project.add_developer(user)

        get :show, namespace_id: project.namespace, project_id: project
      end

      it 'should be success' 


      it 'should render show page' 


      it 'should retrieve project' 

    end

    context 'without enough privileges' do
      before do
        project.add_guest(user)

        get :show, namespace_id: project.namespace, project_id: project
      end

      it 'should respond with 404' 

    end
  end

  describe 'POST #create' do
    let(:remote_file_path) { 'https://gitlab.com/gitlab-org/gitlab-ce/blob/1234/.gitlab-ci-1.yml' }

    let(:remote_file_content) do
      <<~HEREDOC
      before_script:
        - apt-get update -qq && apt-get install -y -qq sqlite3 libsqlite3-dev nodejs
        - ruby -v
        - which ruby
        - gem install bundler --no-ri --no-rdoc
        - bundle install --jobs $(nproc)  "${FLAGS[@]}"
      HEREDOC
    end

    let(:content) do
      <<~HEREDOC
      include:
        - #{remote_file_path}

      rubocop:
        script:
          - bundle exec rubocop
      HEREDOC
    end

    context 'with a valid gitlab-ci.yml' do
      before do
        WebMock.stub_request(:get, remote_file_path).to_return(body: remote_file_content)
        project.add_developer(user)

        post :create, namespace_id: project.namespace, project_id: project, content: content
      end

      it 'should be success' 


      it 'render show page' 


      it 'should retrieve project' 

    end

    context 'with an invalid gitlab-ci.yml' do
      let(:content) do
        <<~HEREDOC
        rubocop:
          scriptt:
            - bundle exec rubocop
        HEREDOC
      end

      before do
        project.add_developer(user)

        post :create, namespace_id: project.namespace, project_id: project, content: content
      end

      it 'should assign errors' 

    end

    context 'without enough privileges' do
      before do
        project.add_guest(user)

        post :create, namespace_id: project.namespace, project_id: project, content: content
      end

      it 'should respond with 404' 

    end
  end
end

