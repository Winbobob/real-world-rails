require 'spec_helper'

describe Projects::BranchesController do
  let(:project)   { create(:project, :repository) }
  let(:user)      { create(:user) }
  let(:developer) { create(:user) }

  before do
    project.add_maintainer(user)
    project.add_developer(user)

    allow(project).to receive(:branches).and_return(['master', 'foo/bar/baz'])
    allow(project).to receive(:tags).and_return(['v1.0.0', 'v2.0.0'])
    controller.instance_variable_set(:@project, project)
  end

  describe "POST create with HTML format" do
    render_views

    context "on creation of a new branch" do
      before do
        sign_in(user)

        post :create,
          namespace_id: project.namespace,
          project_id: project,
          branch_name: branch,
          ref: ref
      end

      context "valid branch name, valid source" do
        let(:branch) { "merge_branch" }
        let(:ref) { "master" }
        it 'redirects' 

      end

      context "invalid branch name, valid ref" do
        let(:branch) { "<script>alert('merge');</script>" }
        let(:ref) { "master" }
        it 'redirects' 

      end

      context "valid branch name, invalid ref" do
        let(:branch) { "merge_branch" }
        let(:ref) { "<script>alert('ref');</script>" }
        it { is_expected.to render_template('new') }
      end

      context "invalid branch name, invalid ref" do
        let(:branch) { "<script>alert('merge');</script>" }
        let(:ref) { "<script>alert('ref');</script>" }
        it { is_expected.to render_template('new') }
      end

      context "valid branch name with encoded slashes" do
        let(:branch) { "feature%2Ftest" }
        let(:ref) { "<script>alert('ref');</script>" }
        it { is_expected.to render_template('new') }
        it { project.repository.branch_exists?('feature/test') }
      end
    end

    describe "created from the new branch button on issues" do
      let(:branch) { "1-feature-branch" }
      let(:issue) { create(:issue, project: project) }

      before do
        sign_in(user)
      end

      it 'redirects' 


      it 'posts a system note' 


      context 'repository-less project' do
        let(:project) { create :project }

        it 'redirects to newly created branch' 


        shared_examples 'same behavior between KubernetesService and Platform::Kubernetes' do
          it 'redirects to autodeploy setup page' 

        end

        context 'when user configured kubernetes from Integration > Kubernetes' do
          before do
            project.services << build(:kubernetes_service)
          end

          it_behaves_like 'same behavior between KubernetesService and Platform::Kubernetes'
        end

        context 'when user configured kubernetes from CI/CD > Clusters' do
          before do
            create(:cluster, :provided_by_gcp, projects: [project])
          end

          it_behaves_like 'same behavior between KubernetesService and Platform::Kubernetes'
        end

        it 'redirects to autodeploy setup page' 

      end

      context 'when create branch service fails' do
        let(:branch) { "./invalid-branch-name" }

        it "doesn't post a system note" 

      end

      context 'without issue feature access' do
        before do
          project.update!(visibility_level: Gitlab::VisibilityLevel::PUBLIC)
          project.project_feature.update!(issues_access_level: ProjectFeature::PRIVATE)
          project.team.truncate
        end

        it "doesn't post a system note" 

      end
    end
  end

  describe 'POST create with JSON format' do
    before do
      sign_in(user)
    end

    context 'with valid params' do
      it 'returns a successful 200 response' 


      it 'returns the created branch' 

    end

    context 'with invalid params' do
      it 'returns an unprocessable entity 422 response' 

    end

    def create_branch(name:, ref:)
      post :create, namespace_id: project.namespace.to_param,
                    project_id: project.to_param,
                    branch_name: name,
                    ref: ref,
                    format: :json
    end
  end

  describe "POST destroy with HTML format" do
    render_views

    before do
      sign_in(user)
    end

    it 'returns 303' 

  end

  describe "POST destroy" do
    render_views

    before do
      sign_in(user)

      post :destroy,
        format: format,
        id: branch,
        namespace_id: project.namespace,
        project_id: project
    end

    context 'as JS' do
      let(:branch) { "feature" }
      let(:format) { :js }

      context "valid branch name, valid source" do
        let(:branch) { "feature" }

        it { expect(response).to have_gitlab_http_status(200) }
        it { expect(response.body).to be_blank }
      end

      context "valid branch name with unencoded slashes" do
        let(:branch) { "improve/awesome" }

        it { expect(response).to have_gitlab_http_status(200) }
        it { expect(response.body).to be_blank }
      end

      context "valid branch name with encoded slashes" do
        let(:branch) { "improve%2Fawesome" }

        it { expect(response).to have_gitlab_http_status(200) }
        it { expect(response.body).to be_blank }
      end

      context "invalid branch name, valid ref" do
        let(:branch) { "no-branch" }

        it { expect(response).to have_gitlab_http_status(404) }
        it { expect(response.body).to be_blank }
      end
    end

    context 'as JSON' do
      let(:branch) { "feature" }
      let(:format) { :json }

      context 'valid branch name, valid source' do
        let(:branch) { "feature" }

        it 'returns JSON response with message' 


        it { expect(response).to have_gitlab_http_status(200) }
      end

      context 'valid branch name with unencoded slashes' do
        let(:branch) { "improve/awesome" }

        it 'returns JSON response with message' 


        it { expect(response).to have_gitlab_http_status(200) }
      end

      context "valid branch name with encoded slashes" do
        let(:branch) { 'improve%2Fawesome' }

        it 'returns JSON response with message' 


        it { expect(response).to have_gitlab_http_status(200) }
      end

      context 'invalid branch name, valid ref' do
        let(:branch) { 'no-branch' }

        it 'returns JSON response with message' 


        it { expect(response).to have_gitlab_http_status(404) }
      end
    end

    context 'as HTML' do
      let(:branch) { "feature" }
      let(:format) { :html }

      it 'redirects to branches path' 

    end
  end

  describe "DELETE destroy_all_merged" do
    def destroy_all_merged
      delete :destroy_all_merged,
             namespace_id: project.namespace,
             project_id: project
    end

    context 'when user is allowed to push' do
      before do
        sign_in(user)
      end

      it 'redirects to branches' 


      it 'starts worker to delete merged branches' 

    end

    context 'when user is not allowed to push' do
      before do
        sign_in(developer)
      end

      it 'responds with status 404' 

    end
  end

  describe "GET index" do
    render_views

    before do
      sign_in(user)
    end

    context 'when rendering a JSON format' do
      it 'filters branches by name' 

    end

    # We need :request_store because Gitaly only counts the queries whenever
    # `RequestStore.active?` in GitalyClient.enforce_gitaly_request_limits
    # And the main goal of this test is making sure TooManyInvocationsError
    # was not raised whenever the cache is enabled yet cold.
    context 'when cache is enabled yet cold', :request_store do
      it 'return with a status 200' 

    end

    context 'when branch contains an invalid UTF-8 sequence' do
      before do
        project.repository.create_branch("wrong-\xE5-utf8-sequence")
      end

      it 'return with a status 200' 

    end

    context 'when deprecated sort/search/page parameters are specified' do
      it 'returns with a status 301 when sort specified' 


      it 'returns with a status 301 when search specified' 


      it 'returns with a status 301 when page specified' 

    end
  end
end

