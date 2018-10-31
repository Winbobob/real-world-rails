require 'spec_helper'

describe Projects::MergeRequestsController do
  include ProjectForksHelper

  let(:project) { create(:project, :repository) }
  let(:user)    { project.owner }
  let(:merge_request) { create(:merge_request_with_diffs, target_project: project, source_project: project) }
  let(:merge_request_with_conflicts) do
    create(:merge_request, source_branch: 'conflict-resolvable', target_branch: 'conflict-start', source_project: project, merge_status: :unchecked) do |mr|
      mr.mark_as_unmergeable
    end
  end

  before do
    sign_in(user)
  end

  describe 'GET commit_change_content' do
    it 'renders commit_change_content template' 

  end

  shared_examples "loads labels" do |action|
    it "loads labels into the @labels variable" 

  end

  describe "GET show" do
    def go(extra_params = {})
      params = {
        namespace_id: project.namespace.to_param,
        project_id: project,
        id: merge_request.iid
      }

      get :show, params.merge(extra_params)
    end

    it_behaves_like "loads labels", :show

    describe 'as html' do
      context 'when diff files were cleaned' do
        render_views

        it 'renders page when diff size is not persisted and diff_refs does not exist' 

      end

      it "renders merge request page" 


      context "that is invalid" do
        let(:merge_request) { create(:invalid_merge_request, target_project: project, source_project: project) }

        it "renders merge request page" 

      end
    end

    context 'when user is setting notes filters' do
      let(:issuable) { merge_request }
      let!(:discussion_note) { create(:discussion_note_on_merge_request, :system, noteable: issuable, project: project) }
      let!(:discussion_comment) { create(:discussion_note_on_merge_request, noteable: issuable, project: project) }

      it_behaves_like 'issuable notes filter'
    end

    describe 'as json' do
      context 'with basic serializer param' do
        it 'renders basic MR entity as json' 

      end

      context 'with widget serializer param' do
        it 'renders widget MR entity as json' 

      end

      context 'when no serialiser was passed' do
        it 'renders widget MR entity as json' 

      end

      context "that is invalid" do
        let(:merge_request) { create(:invalid_merge_request, target_project: project, source_project: project) }

        it "renders merge request page" 

      end
    end

    describe "as diff" do
      it "triggers workhorse to serve the request" 

    end

    describe "as patch" do
      it 'triggers workhorse to serve the request' 

    end
  end

  describe 'GET index' do
    let(:merge_request) { create(:merge_request_with_diffs, target_project: project, source_project: project) }

    def get_merge_requests(page = nil)
      get :index,
          namespace_id: project.namespace.to_param,
          project_id: project,
          state: 'opened', page: page.to_param
    end

    it_behaves_like "issuables list meta-data", :merge_request

    context 'when page param' do
      let(:last_page) { project.merge_requests.page().total_pages }
      let!(:merge_request) { create(:merge_request_with_diffs, target_project: project, source_project: project) }

      it 'redirects to last_page if page number is larger than number of pages' 


      it 'redirects to specified page' 


      it 'does not redirect to external sites when provided a host field' 

    end

    context 'when filtering by opened state' do
      context 'with opened merge requests' do
        it 'lists those merge requests' 

      end

      context 'with reopened merge requests' do
        before do
          merge_request.close!
          merge_request.reopen!
        end

        it 'lists those merge requests' 

      end
    end
  end

  describe 'PUT update' do
    def update_merge_request(mr_params, additional_params = {})
      params = {
        namespace_id: project.namespace,
        project_id: project,
        id: merge_request.iid,
        merge_request: mr_params
      }.merge(additional_params)

      put :update, params
    end

    context 'changing the assignee' do
      it 'limits the attributes exposed on the assignee' 

    end

    context 'when user does not have access to update issue' do
      before do
        reporter = create(:user)
        project.add_reporter(reporter)
        sign_in(reporter)
      end

      it 'responds with 404' 

    end

    context 'there is no source project' do
      let(:project)       { create(:project, :repository) }
      let(:forked_project)  { fork_project_with_submodules(project) }
      let!(:merge_request) { create(:merge_request, source_project: forked_project, source_branch: 'add-submodule-version-bump', target_branch: 'master', target_project: project) }

      before do
        forked_project.destroy
      end

      it 'closes MR without errors' 


      it 'allows editing of a closed merge request' 


      it 'does not allow to update target branch closed merge request' 


      it_behaves_like 'update invalid issuable', MergeRequest
    end
  end

  describe 'POST merge' do
    let(:base_params) do
      {
        namespace_id: project.namespace,
        project_id: project,
        id: merge_request.iid,
        squash: false,
        format: 'json'
      }
    end

    context 'when user cannot access' do
      let(:user) { create(:user) }

      before do
        project.add_reporter(user)
        xhr :post, :merge, base_params
      end

      it 'returns 404' 

    end

    context 'when the merge request is not mergeable' do
      before do
        merge_request.update(title: "WIP: #{merge_request.title}")

        post :merge, base_params
      end

      it 'returns :failed' 

    end

    context 'when the sha parameter does not match the source SHA' do
      before do
        post :merge, base_params.merge(sha: 'foo')
      end

      it 'returns :sha_mismatch' 

    end

    context 'when the sha parameter matches the source SHA' do
      def merge_with_sha(params = {})
        post_params = base_params.merge(sha: merge_request.diff_head_sha).merge(params)
        if Gitlab.rails5?
          post :merge, params: post_params, as: :json
        else
          post :merge, post_params
        end
      end

      it 'returns :success' 


      it 'starts the merge immediately with permitted params' 


      context 'when squash is passed as 1' do
        it 'updates the squash attribute on the MR to true' 

      end

      context 'when squash is passed as 0' do
        it 'updates the squash attribute on the MR to false' 

      end

      context 'when the pipeline succeeds is passed' do
        let!(:head_pipeline) do
          create(:ci_empty_pipeline, project: project, sha: merge_request.diff_head_sha, ref: merge_request.source_branch, head_pipeline_of: merge_request)
        end

        def merge_when_pipeline_succeeds
          post :merge, base_params.merge(sha: merge_request.diff_head_sha, merge_when_pipeline_succeeds: '1')
        end

        it 'returns :merge_when_pipeline_succeeds' 


        it 'sets the MR to merge when the pipeline succeeds' 


        context 'when project.only_allow_merge_if_pipeline_succeeds? is true' do
          before do
            project.update_column(:only_allow_merge_if_pipeline_succeeds, true)
          end

          context 'and head pipeline is not the current one' do
            before do
              head_pipeline.update(sha: 'not_current_sha')
            end

            it 'returns :failed' 

          end

          it 'returns :merge_when_pipeline_succeeds' 

        end
      end

      describe 'only_allow_merge_if_all_discussions_are_resolved? setting' do
        let(:merge_request) { create(:merge_request_with_diff_notes, source_project: project, author: user) }

        context 'when enabled' do
          before do
            project.update_column(:only_allow_merge_if_all_discussions_are_resolved, true)
          end

          context 'with unresolved discussion' do
            before do
              expect(merge_request).not_to be_discussions_resolved
            end

            it 'returns :failed' 

          end

          context 'with all discussions resolved' do
            before do
              merge_request.discussions.each { |d| d.resolve!(user) }
              expect(merge_request).to be_discussions_resolved
            end

            it 'returns :success' 

          end
        end

        context 'when disabled' do
          before do
            project.update_column(:only_allow_merge_if_all_discussions_are_resolved, false)
          end

          context 'with unresolved discussion' do
            before do
              expect(merge_request).not_to be_discussions_resolved
            end

            it 'returns :success' 

          end

          context 'with all discussions resolved' do
            before do
              merge_request.discussions.each { |d| d.resolve!(user) }
              expect(merge_request).to be_discussions_resolved
            end

            it 'returns :success' 

          end
        end
      end
    end
  end

  describe "DELETE destroy" do
    let(:user) { create(:user) }

    it "denies access to users unless they're admin or project owner" 


    context "when the user is owner" do
      let(:owner)     { create(:user) }
      let(:namespace) { create(:namespace, owner: owner) }
      let(:project)   { create(:project, :repository, namespace: namespace) }

      before do
        sign_in owner
      end

      it "deletes the merge request" 


      it 'delegates the update of the todos count cache to TodoService' 

    end
  end

  describe 'GET commits' do
    def go(format: 'html')
      get :commits,
          namespace_id: project.namespace.to_param,
          project_id: project,
          id: merge_request.iid,
          format: format
    end

    it 'renders the commits template to a string' 

  end

  describe 'GET pipelines' do
    before do
      create(:ci_pipeline, project: merge_request.source_project,
                           ref: merge_request.source_branch,
                           sha: merge_request.diff_head_sha)

      get :pipelines,
          namespace_id: project.namespace.to_param,
          project_id: project,
          id: merge_request.iid,
          format: :json
    end

    it 'responds with serialized pipelines' 

  end

  describe 'GET test_reports' do
    subject do
      get :test_reports,
          namespace_id: project.namespace.to_param,
          project_id: project,
          id: merge_request.iid,
          format: :json
    end

    before do
      allow_any_instance_of(MergeRequest)
        .to receive(:compare_test_reports).and_return(comparison_status)
    end

    context 'when comparison is being processed' do
      let(:comparison_status) { { status: :parsing } }

      it 'sends polling interval' 


      it 'returns 204 HTTP status' 

    end

    context 'when comparison is done' do
      let(:comparison_status) { { status: :parsed, data: { summary: 1 } } }

      it 'does not send polling interval' 


      it 'returns 200 HTTP status' 

    end

    context 'when user created corrupted test reports' do
      let(:comparison_status) { { status: :error, status_reason: 'Failed to parse test reports' } }

      it 'does not send polling interval' 


      it 'returns 400 HTTP status' 

    end

    context 'when something went wrong on our system' do
      let(:comparison_status) { {} }

      it 'does not send polling interval' 


      it 'returns 500 HTTP status' 

    end
  end

  describe 'POST remove_wip' do
    before do
      merge_request.title = merge_request.wip_title
      merge_request.save

      xhr :post, :remove_wip,
        namespace_id: merge_request.project.namespace.to_param,
        project_id: merge_request.project,
        id: merge_request.iid,
        format: :json
    end

    it 'removes the wip status' 


    it 'renders MergeRequest as JSON' 

  end

  describe 'POST cancel_merge_when_pipeline_succeeds' do
    subject do
      xhr :post, :cancel_merge_when_pipeline_succeeds,
        namespace_id: merge_request.project.namespace.to_param,
        project_id: merge_request.project,
        id: merge_request.iid,
        format: :json
    end

    it 'calls MergeRequests::MergeWhenPipelineSucceedsService' 


    it { is_expected.to have_gitlab_http_status(:success) }

    it 'renders MergeRequest as JSON' 

  end

  describe 'POST assign_related_issues' do
    let(:issue1) { create(:issue, project: project) }
    let(:issue2) { create(:issue, project: project) }

    def post_assign_issues
      merge_request.update!(description: "Closes #{issue1.to_reference} and #{issue2.to_reference}",
                            author: user,
                            source_branch: 'feature',
                            target_branch: 'master')

      post :assign_related_issues,
           namespace_id: project.namespace.to_param,
           project_id: project,
           id: merge_request.iid
    end

    it 'shows a flash message on success' 


    it 'correctly pluralizes flash message on success' 


    it 'calls MergeRequests::AssignIssuesService' 


    it 'is skipped when not signed in' 

  end

  describe 'GET ci_environments_status' do
    context 'the environment is from a forked project' do
      let(:forked)      { fork_project(project, user, repository: true) }
      let(:sha)         { forked.commit.sha }
      let(:environment) { create(:environment, project: forked) }
      let(:pipeline)    { create(:ci_pipeline, sha: sha, project: forked) }
      let(:build)       { create(:ci_build, pipeline: pipeline) }
      let!(:deployment) { create(:deployment, environment: environment, sha: sha, ref: 'master', deployable: build) }

      let(:merge_request) do
        create(:merge_request, source_project: forked, target_project: project, target_branch: 'master', head_pipeline: pipeline)
      end

      it 'links to the environment on that project' 


      context "when environment_target is 'merge_commit'" do
        it 'returns nothing' 


        context 'when is merged' do
          let(:source_environment)  { create(:environment, project: project) }
          let(:merge_commit_sha)    { project.repository.merge(user, forked.commit.id, merge_request, "merged in test") }
          let(:post_merge_pipeline) { create(:ci_pipeline, sha: merge_commit_sha, project: project) }
          let(:post_merge_build)    { create(:ci_build, pipeline: post_merge_pipeline) }
          let!(:source_deployment)  { create(:deployment, environment: source_environment, sha: merge_commit_sha, ref: 'master', deployable: post_merge_build) }

          before do
            merge_request.update!(merge_commit_sha: merge_commit_sha)
            merge_request.mark_as_merged!
          end

          it 'returns the enviroment on the source project' 

        end
      end

      # we're trying to reduce the overall number of queries for this method.
      # set a hard limit for now. https://gitlab.com/gitlab-org/gitlab-ce/issues/52287
      it 'keeps queries in check' 


      def get_ci_environments_status(extra_params = {})
        params = {
          namespace_id: merge_request.project.namespace.to_param,
          project_id: merge_request.project,
          id: merge_request.iid,
          format: 'json'
        }

        get :ci_environments_status, params.merge(extra_params)
      end
    end
  end

  describe 'GET pipeline_status.json' do
    context 'when head_pipeline exists' do
      let!(:pipeline) do
        create(:ci_pipeline, project: merge_request.source_project,
                             ref: merge_request.source_branch,
                             sha: merge_request.diff_head_sha,
                             head_pipeline_of: merge_request)
      end

      let(:status) { pipeline.detailed_status(double('user')) }

      before do
        get_pipeline_status
      end

      it 'return a detailed head_pipeline status in json' 

    end

    context 'when head_pipeline does not exist' do
      before do
        get_pipeline_status
      end

      it 'return empty' 

    end

    def get_pipeline_status
      get :pipeline_status, namespace_id: project.namespace,
                            project_id: project,
                            id: merge_request.iid,
                            format: :json
    end
  end

  describe 'POST #rebase' do
    let(:viewer)        { user }

    def post_rebase
      post :rebase, namespace_id: project.namespace, project_id: project, id: merge_request
    end

    def expect_rebase_worker_for(user)
      expect(RebaseWorker).to receive(:perform_async).with(merge_request.id, user.id)
    end

    context 'successfully' do
      it 'enqeues a RebaseWorker' 

    end

    context 'with a forked project' do
      let(:forked_project) { fork_project(project, fork_owner, repository: true) }
      let(:fork_owner) { create(:user) }

      before do
        project.add_developer(fork_owner)

        merge_request.update!(source_project: forked_project)
        forked_project.add_reporter(user)
      end

      context 'user cannot push to source branch' do
        it 'returns 404' 

      end

      context 'user can push to source branch' do
        before do
          project.add_reporter(fork_owner)

          sign_in(fork_owner)
        end

        it 'returns 200' 

      end
    end
  end

  describe 'GET edit' do
    it 'responds successfully' 


    it 'assigns the noteable to make sure autocompletes work' 

  end
end

