require "spec_helper"

describe API::MergeRequests do
  include ProjectForksHelper

  let(:base_time)   { Time.now }
  let(:user)        { create(:user) }
  let(:admin)       { create(:user, :admin) }
  let(:non_member)  { create(:user) }
  let!(:project)    { create(:project, :public, :repository, creator: user, namespace: user.namespace, only_allow_merge_if_pipeline_succeeds: false) }
  let(:milestone)   { create(:milestone, title: '1.0.0', project: project) }
  let(:pipeline)    { create(:ci_empty_pipeline) }
  let(:milestone1)   { create(:milestone, title: '0.9', project: project) }
  let!(:merge_request) { create(:merge_request, :simple, milestone: milestone1, author: user, assignee: user, source_project: project, target_project: project, title: "Test", created_at: base_time) }
  let!(:merge_request_closed) { create(:merge_request, state: "closed", milestone: milestone1, author: user, assignee: user, source_project: project, target_project: project, title: "Closed test", created_at: base_time + 1.second) }
  let!(:merge_request_merged) { create(:merge_request, state: "merged", author: user, assignee: user, source_project: project, target_project: project, title: "Merged test", created_at: base_time + 2.seconds, merge_commit_sha: '9999999999999999999999999999999999999999') }
  let!(:merge_request_locked) { create(:merge_request, state: "locked", milestone: milestone1, author: user, assignee: user, source_project: project, target_project: project, title: "Locked test", created_at: base_time + 1.second) }
  let!(:note)       { create(:note_on_merge_request, author: user, project: project, noteable: merge_request, note: "a comment on a MR") }
  let!(:note2)      { create(:note_on_merge_request, author: user, project: project, noteable: merge_request, note: "another comment on a MR") }
  let!(:label) do
    create(:label, title: 'label', color: '#FFAABB', project: project)
  end
  let!(:label2) { create(:label, title: 'a-test', color: '#FFFFFF', project: project) }
  let!(:label_link) { create(:label_link, label: label, target: merge_request) }
  let!(:label_link2) { create(:label_link, label: label2, target: merge_request) }
  let!(:downvote) { create(:award_emoji, :downvote, awardable: merge_request) }
  let!(:upvote) { create(:award_emoji, :upvote, awardable: merge_request) }

  before do
    project.add_reporter(user)
  end

  describe 'route shadowing' do
    include GrapePathHelpers::NamedRouteMatcher

    it 'does not occur' 

  end

  describe 'GET /merge_requests' do
    context 'when unauthenticated' do
      it 'returns an array of all merge requests' 


      it "returns authentication error without any scope" 


      it "returns authentication error  when scope is assigned-to-me" 


      it "returns authentication error when scope is assigned_to_me" 


      it "returns authentication error  when scope is created-by-me" 

    end

    context 'when authenticated' do
      let!(:project2) { create(:project, :public, namespace: user.namespace) }
      let!(:merge_request2) { create(:merge_request, :simple, author: user, assignee: user, source_project: project2, target_project: project2) }
      let(:user2) { create(:user) }

      it 'returns an array of all merge requests except unauthorized ones' 


      it "returns an array of no merge_requests when wip=yes" 


      it "returns an array of no merge_requests when wip=no" 


      it 'does not return unauthorized merge requests' 


      it 'returns an array of merge requests created by current user if no scope is given' 


      it 'returns an array of merge requests authored by the given user' 


      it 'returns an array of merge requests assigned to the given user' 


      it 'returns an array of merge requests with no assignee' 


      it 'returns an array of merge requests with any assignee' 


      it 'returns an array of merge requests assigned to me' 


      it 'returns an array of merge requests assigned to me (kebab-case)' 


      it 'returns an array of merge requests created by me' 


      it 'returns an array of merge requests created by me (kebab-case)' 


      it 'returns merge requests reacted by the authenticated user by the given emoji' 


      context 'source_branch param' do
        it 'returns merge requests with the given source branch' 

      end

      context 'target_branch param' do
        it 'returns merge requests with the given target branch' 

      end

      it 'returns merge requests created before a specific date' 


      it 'returns merge requests created after a specific date' 


      it 'returns merge requests updated before a specific date' 


      it 'returns merge requests updated after a specific date' 


      context 'search params' do
        before do
          merge_request.update(title: 'Search title', description: 'Search description')
        end

        it 'returns merge requests matching given search string for title' 


        it 'returns merge requests for project matching given search string for description' 

      end

      context 'state param' do
        it 'returns merge requests with the given state' 

      end
    end
  end

  describe "GET /projects/:id/merge_requests" do
    let(:endpoint_path) { "/projects/#{project.id}/merge_requests" }

    it_behaves_like 'merge requests list'

    it "returns 404 for non public projects" 


    it "returns an array of no merge_requests when wip=yes" 


    it 'returns merge_request by "iids" array' 

  end

  describe "GET /groups/:id/merge_requests" do
    let!(:group) { create(:group, :public) }
    let!(:project) { create(:project, :public, :repository, creator: user, namespace: group, only_allow_merge_if_pipeline_succeeds: false) }
    let(:endpoint_path) { "/groups/#{group.id}/merge_requests" }

    before do
      group.add_reporter(user)
    end

    it_behaves_like 'merge requests list'

    context 'when have subgroups', :nested_groups do
      let!(:group) { create(:group, :public) }
      let!(:subgroup) { create(:group, parent: group) }
      let!(:project) { create(:project, :public, :repository, creator: user, namespace: subgroup, only_allow_merge_if_pipeline_succeeds: false) }

      it_behaves_like 'merge requests list'
    end
  end

  describe "GET /projects/:id/merge_requests/:merge_request_iid" do
    it 'exposes known attributes' 


    it 'exposes description and title html when render_html is true' 


    context 'merge_request_metrics' do
      before do
        merge_request.metrics.update!(merged_by: user,
                                      latest_closed_by: user,
                                      latest_closed_at: 1.hour.ago,
                                      merged_at: 2.hours.ago,
                                      pipeline: pipeline,
                                      latest_build_started_at: 3.hours.ago,
                                      latest_build_finished_at: 1.hour.ago,
                                      first_deployed_to_production_at: 3.minutes.ago)
      end

      it 'has fields from merge request metrics' 


      it 'returns correct values' 

    end

    it 'returns the commits behind the target branch when include_diverged_commits_count is present' 


    it "returns a 404 error if merge_request_iid not found" 


    it "returns a 404 error if merge_request `id` is used instead of iid" 


    context 'Work in Progress' do
      let!(:merge_request_wip) { create(:merge_request, author: user, assignee: user, source_project: project, target_project: project, title: "WIP: Test", created_at: base_time + 1.second) }

      it "returns merge request" 

    end

    context 'when a merge request has more than the changes limit' do
      it "returns a string indicating that more changes were made" 

    end

    context 'for forked projects' do
      let(:user2) { create(:user) }
      let(:project) { create(:project, :public, :repository) }
      let(:forked_project) { fork_project(project, user2, repository: true) }
      let(:merge_request) do
        create(:merge_request,
               source_project: forked_project,
               target_project: project,
               source_branch: 'fixes',
               allow_collaboration: true)
      end

      it 'includes the `allow_collaboration` field' 

    end
  end

  describe 'GET /projects/:id/merge_requests/:merge_request_iid/participants' do
    it_behaves_like 'issuable participants endpoint' do
      let(:entity) { merge_request }
    end
  end

  describe 'GET /projects/:id/merge_requests/:merge_request_iid/commits' do
    it 'returns a 200 when merge request is valid' 


    it 'returns a 404 when merge_request_iid not found' 


    it 'returns a 404 when merge_request id is used instead of iid' 

  end

  describe 'GET /projects/:id/merge_requests/:merge_request_iid/changes' do
    it 'returns the change information of the merge_request' 


    it 'returns a 404 when merge_request_iid not found' 


    it 'returns a 404 when merge_request id is used instead of iid' 

  end

  describe 'GET /projects/:id/merge_requests/:merge_request_iid/pipelines' do
    context 'when authorized' do
      let!(:pipeline) { create(:ci_empty_pipeline, project: project, user: user, ref: merge_request.source_branch, sha: merge_request.diff_head_sha) }
      let!(:pipeline2) { create(:ci_empty_pipeline, project: project) }

      it 'returns a paginated array of corresponding pipelines' 


      it 'exposes basic attributes' 


      it 'returns 404 if MR does not exist' 

    end

    context 'when unauthorized' do
      it 'returns 403' 

    end
  end

  describe "POST /projects/:id/merge_requests" do
    context 'between branches projects' do
      it "returns merge_request" 


      it "returns 422 when source_branch equals target_branch" 


      it "returns 400 when source_branch is missing" 


      it "returns 400 when target_branch is missing" 


      it "returns 400 when title is missing" 


      it 'allows special label names' 


      context 'with existing MR' do
        before do
          post api("/projects/#{project.id}/merge_requests", user),
               title: 'Test merge_request',
               source_branch: 'feature_conflict',
               target_branch: 'master',
               author: user
          @mr = MergeRequest.all.last
        end

        it 'returns 409 when MR already exists for source/target' 

      end

      context 'accepts remove_source_branch parameter' do
        let(:params) do
          { title: 'Test merge_request',
            source_branch: 'markdown',
            target_branch: 'master',
            author: user }
        end

        it 'sets force_remove_source_branch to false' 


        it 'sets force_remove_source_branch to true' 

      end
    end

    context 'forked projects' do
      let!(:user2) { create(:user) }
      let(:project) { create(:project, :public, :repository) }
      let!(:forked_project) { fork_project(project, user2, repository: true) }
      let!(:unrelated_project) { create(:project,  namespace: create(:user).namespace, creator_id: user2.id) }

      before do
        forked_project.add_reporter(user2)
      end

      it "returns merge_request" 


      it "does not return 422 when source_branch equals target_branch" 


      it 'returns 403 when target project has disabled merge requests' 


      it "returns 400 when source_branch is missing" 


      it "returns 400 when target_branch is missing" 


      it "returns 400 when title is missing" 


      it 'allows setting `allow_collaboration`' 


      context 'when target_branch and target_project_id is specified' do
        let(:params) do
          { title: 'Test merge_request',
            target_branch: 'master',
            source_branch: 'markdown',
            author: user2,
            target_project_id: unrelated_project.id }
        end

        it 'returns 422 if targeting a different fork' 


        it 'returns 403 if targeting a different fork which user can not access' 

      end

      it "returns 201 when target_branch is specified and for the same project" 

    end
  end

  describe "DELETE /projects/:id/merge_requests/:merge_request_iid" do
    context "when the user is developer" do
      let(:developer) { create(:user) }

      before do
        project.add_developer(developer)
      end

      it "denies the deletion of the merge request" 

    end

    context "when the user is project owner" do
      it "destroys the merge request owners can destroy" 


      it "returns 404 for an invalid merge request IID" 


      it "returns 404 if the merge request id is used instead of iid" 


      it_behaves_like '412 response' do
        let(:request) { api("/projects/#{project.id}/merge_requests/#{merge_request.iid}", user) }
      end
    end
  end

  describe "PUT /projects/:id/merge_requests/:merge_request_iid/merge" do
    let(:pipeline) { create(:ci_pipeline_without_jobs) }

    it "returns merge_request in case of success" 


    it "returns 406 if branch can't be merged" 


    it "returns 405 if merge_request is not open" 


    it "returns 405 if merge_request is a work in progress" 


    it 'returns 405 if the build failed for a merge request that requires success' 


    it "returns 401 if user has no permissions to merge" 


    it "returns 409 if the SHA parameter doesn't match" 


    it "succeeds if the SHA parameter matches" 


    it "updates the MR's squash attribute" 


    it "enables merge when pipeline succeeds if the pipeline is active" 


    it "enables merge when pipeline succeeds if the pipeline is active and only_allow_merge_if_pipeline_succeeds is true" 


    it "returns 404 for an invalid merge request IID" 


    it "returns 404 if the merge request id is used instead of iid" 

  end

  describe "PUT /projects/:id/merge_requests/:merge_request_iid" do
    context "to close a MR" do
      it "returns merge_request" 

    end

    it "updates title and returns merge_request" 


    it "updates description and returns merge_request" 


    it "updates milestone_id and returns merge_request" 


    it "updates squash and returns merge_request" 


    it "returns merge_request with renamed target_branch" 


    it "returns merge_request that removes the source branch" 


    it 'allows special label names' 


    it 'does not update state when title is empty' 


    it 'does not update state when target_branch is empty' 


    it "returns 404 for an invalid merge request IID" 


    it "returns 404 if the merge request id is used instead of iid" 

  end

  describe 'GET :id/merge_requests/:merge_request_iid/closes_issues' do
    it 'returns the issue that will be closed on merge' 


    it 'returns an empty array when there are no issues to be closed' 


    it 'handles external issues' 


    it 'returns 403 if the user has no access to the merge request' 


    it "returns 404 for an invalid merge request IID" 


    it "returns 404 if the merge request id is used instead of iid" 

  end

  describe 'POST :id/merge_requests/:merge_request_iid/subscribe' do
    it 'subscribes to a merge request' 


    it 'returns 304 if already subscribed' 


    it 'returns 404 if the merge request is not found' 


    it 'returns 404 if the merge request id is used instead of iid' 


    it 'returns 403 if user has no access to read code' 

  end

  describe 'POST :id/merge_requests/:merge_request_iid/unsubscribe' do
    it 'unsubscribes from a merge request' 


    it 'returns 304 if not subscribed' 


    it 'returns 404 if the merge request is not found' 


    it 'returns 404 if the merge request id is used instead of iid' 


    it 'returns 403 if user has no access to read code' 

  end

  describe 'POST :id/merge_requests/:merge_request_iid/cancel_merge_when_pipeline_succeeds' do
    before do
      ::MergeRequests::MergeWhenPipelineSucceedsService.new(merge_request.target_project, user).execute(merge_request)
    end

    it 'removes the merge_when_pipeline_succeeds status' 


    it 'returns 404 if the merge request is not found' 


    it 'returns 404 if the merge request id is used instead of iid' 

  end

  describe 'Time tracking' do
    let(:issuable) { merge_request }

    include_examples 'time tracking endpoints', 'merge_request'
  end

  def mr_with_later_created_and_updated_at_time
    merge_request
    merge_request.created_at += 1.hour
    merge_request.updated_at += 30.minutes
    merge_request.save
    merge_request
  end

  def mr_with_earlier_created_and_updated_at_time
    merge_request_closed
    merge_request_closed.created_at -= 1.hour
    merge_request_closed.updated_at -= 30.minutes
    merge_request_closed.save
    merge_request_closed
  end

  def expect_response_contain_exactly(*items)
    expect_paginated_array_response
    expect(json_response.length).to eq(items.size)
    expect(json_response.map { |element| element['id'] }).to contain_exactly(*items.map(&:id))
  end

  def expect_response_ordered_exactly(*items)
    expect_paginated_array_response
    expect(json_response.length).to eq(items.size)
    expect(json_response.map { |element| element['id'] }).to eq(items.map(&:id))
  end

  def expect_paginated_array_response
    expect(response).to have_gitlab_http_status(200)
    expect(response).to include_pagination_headers
    expect(json_response).to be_an Array
  end
end

