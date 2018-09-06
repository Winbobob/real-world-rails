require 'spec_helper'

describe Import::BitbucketController do
  include ImportSpecHelper

  let(:user) { create(:user) }
  let(:token) { "asdasd12345" }
  let(:secret) { "sekrettt" }
  let(:refresh_token) { SecureRandom.hex(15) }
  let(:access_params) { { token: token, expires_at: nil, expires_in: nil, refresh_token: nil } }

  def assign_session_tokens
    session[:bitbucket_token] = token
  end

  before do
    sign_in(user)
    allow(controller).to receive(:bitbucket_import_enabled?).and_return(true)
  end

  describe "GET callback" do
    before do
      session[:oauth_request_token] = {}
    end

    it "updates access token" 

  end

  describe "GET status" do
    before do
      @repo = double(slug: 'vim', owner: 'asd', full_name: 'asd/vim', "valid?" => true)
      assign_session_tokens
    end

    it "assigns variables" 


    it "does not show already added project" 

  end

  describe "POST create" do
    let(:bitbucket_username) { user.username }

    let(:bitbucket_user) do
      double(username: bitbucket_username)
    end

    let(:bitbucket_repo) do
      double(slug: "vim", owner: bitbucket_username, name: 'vim')
    end

    let(:project) { create(:project) }

    before do
      allow_any_instance_of(Bitbucket::Client).to receive(:repo).and_return(bitbucket_repo)
      allow_any_instance_of(Bitbucket::Client).to receive(:user).and_return(bitbucket_user)
      assign_session_tokens
    end

    it 'returns 200 response when the project is imported successfully' 


    it 'returns 422 response when the project could not be imported' 


    context "when the repository owner is the Bitbucket user" do
      context "when the Bitbucket user and GitLab user's usernames match" do
        it "takes the current user's namespace" 

      end

      context "when the Bitbucket user and GitLab user's usernames don't match" do
        let(:bitbucket_username) { "someone_else" }

        it "takes the current user's namespace" 

      end

      context 'when the Bitbucket user is unauthorized' do
        render_views

        it 'returns unauthorized' 

      end
    end

    context "when the repository owner is not the Bitbucket user" do
      let(:other_username) { "someone_else" }

      before do
        allow(bitbucket_repo).to receive(:owner).and_return(other_username)
      end

      context "when a namespace with the Bitbucket user's username already exists" do
        let!(:existing_namespace) { create(:group, name: other_username) }

        context "when the namespace is owned by the GitLab user" do
          before do
            existing_namespace.add_owner(user)
          end

          it "takes the existing namespace" 

        end

        context "when the namespace is not owned by the GitLab user" do
          it "doesn't create a project" 

        end
      end

      context "when a namespace with the Bitbucket user's username doesn't exist" do
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
    end

    context 'user has chosen an existing nested namespace and name for the project', :postgresql do
      let(:parent_namespace) { create(:group, name: 'foo') }
      let(:nested_namespace) { create(:group, name: 'bar', parent: parent_namespace) }
      let(:test_name) { 'test_name' }

      before do
        parent_namespace.add_owner(user)
        nested_namespace.add_owner(user)
      end

      it 'takes the selected namespace and name' 

    end

    context 'user has chosen a non-existent nested namespaces and name for the project', :postgresql do
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

