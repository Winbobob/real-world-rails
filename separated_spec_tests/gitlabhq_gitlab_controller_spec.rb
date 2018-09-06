require 'spec_helper'

describe Import::GitlabController do
  include ImportSpecHelper

  let(:user) { create(:user) }
  let(:token) { "asdasd12345" }
  let(:access_params) { { gitlab_access_token: token } }

  def assign_session_token
    session[:gitlab_access_token] = token
  end

  before do
    sign_in(user)
    allow(controller).to receive(:gitlab_import_enabled?).and_return(true)
  end

  describe "GET callback" do
    it "updates access token" 

  end

  describe "GET status" do
    before do
      @repo = OpenStruct.new(path: 'vim', path_with_namespace: 'asd/vim')
      assign_session_token
    end

    it "assigns variables" 


    it "does not show already added project" 

  end

  describe "POST create" do
    let(:project) { create(:project) }
    let(:gitlab_username) { user.username }
    let(:gitlab_user) do
      { username: gitlab_username }.with_indifferent_access
    end
    let(:gitlab_repo) do
      {
        path: 'vim',
        path_with_namespace: "#{gitlab_username}/vim",
        owner: { name: gitlab_username },
        namespace: { path: gitlab_username }
      }.with_indifferent_access
    end

    before do
      stub_client(user: gitlab_user, project: gitlab_repo)
      assign_session_token
    end

    it 'returns 200 response when the project is imported successfully' 


    it 'returns 422 response when the project could not be imported' 


    context "when the repository owner is the GitLab.com user" do
      context "when the GitLab.com user and GitLab server user's usernames match" do
        it "takes the current user's namespace" 

      end

      context "when the GitLab.com user and GitLab server user's usernames don't match" do
        let(:gitlab_username) { "someone_else" }

        it "takes the current user's namespace" 

      end
    end

    context "when the repository owner is not the GitLab.com user" do
      let(:other_username) { "someone_else" }

      before do
        gitlab_repo["namespace"]["path"] = other_username
        assign_session_token
      end

      context "when a namespace with the GitLab.com user's username already exists" do
        let!(:existing_namespace) { create(:group, name: other_username) }

        context "when the namespace is owned by the GitLab server user" do
          before do
            existing_namespace.add_owner(user)
          end

          it "takes the existing namespace" 

        end

        context "when the namespace is not owned by the GitLab server user" do
          it "doesn't create a project" 

        end
      end

      context "when a namespace with the GitLab.com user's username doesn't exist" do
        context "when current user can create namespaces" do
          it "creates the namespace" 


          it "takes the new namespace" 

        end

        context "when current user can't create namespaces" do
          before do
            user.update_attribute(:can_create_group, false)
          end

          it "doesn't create the namespace" 


          it "takes the current user's namespace" 

        end
      end

      context 'user has chosen an existing nested namespace for the project', :postgresql do
        let(:parent_namespace) { create(:group, name: 'foo') }
        let(:nested_namespace) { create(:group, name: 'bar', parent: parent_namespace) }

        before do
          parent_namespace.add_owner(user)
          nested_namespace.add_owner(user)
        end

        it 'takes the selected namespace and name' 

      end

      context 'user has chosen a non-existent nested namespaces for the project', :postgresql do
        let(:test_name) { 'test_name' }

        it 'takes the selected namespace and name' 


        it 'creates the namespaces' 


        it 'new namespace has the right parent' 

      end

      context 'user has chosen existent and non-existent nested namespaces and name for the project', :postgresql do
        let(:test_name) { 'test_name' }
        let!(:parent_namespace) { create(:group, name: 'foo') }

        before do
          parent_namespace.add_owner(user)
        end

        it 'takes the selected namespace and name' 


        it 'creates the namespaces' 

      end

      context 'when user can not create projects in the chosen namespace' do
        it 'returns 422 response' 

      end
    end
  end
end

