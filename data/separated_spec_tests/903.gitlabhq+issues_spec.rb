require 'spec_helper'

describe API::Issues do
  set(:user) { create(:user) }
  set(:project) do
    create(:project, :public, creator_id: user.id, namespace: user.namespace)
  end

  let(:user2)       { create(:user) }
  let(:non_member)  { create(:user) }
  set(:guest)       { create(:user) }
  set(:author)      { create(:author) }
  set(:assignee)    { create(:assignee) }
  let(:admin)       { create(:user, :admin) }
  let(:issue_title)       { 'foo' }
  let(:issue_description) { 'closed' }
  let!(:closed_issue) do
    create :closed_issue,
           author: user,
           assignees: [user],
           project: project,
           state: :closed,
           milestone: milestone,
           created_at: generate(:past_time),
           updated_at: 3.hours.ago,
           closed_at: 1.hour.ago
  end
  let!(:confidential_issue) do
    create :issue,
           :confidential,
           project: project,
           author: author,
           assignees: [assignee],
           created_at: generate(:past_time),
           updated_at: 2.hours.ago
  end
  let!(:issue) do
    create :issue,
           author: user,
           assignees: [user],
           project: project,
           milestone: milestone,
           created_at: generate(:past_time),
           updated_at: 1.hour.ago,
           title: issue_title,
           description: issue_description
  end
  set(:label) do
    create(:label, title: 'label', color: '#FFAABB', project: project)
  end
  let!(:label_link) { create(:label_link, label: label, target: issue) }
  set(:milestone) { create(:milestone, title: '1.0.0', project: project) }
  set(:empty_milestone) do
    create(:milestone, title: '2.0.0', project: project)
  end
  let!(:note) { create(:note_on_issue, author: user, project: project, noteable: issue) }

  let(:no_milestone_title) { URI.escape(Milestone::None.title) }
  let(:any_milestone_title) { URI.escape(Milestone::Any.title) }

  before(:all) do
    project.add_reporter(user)
    project.add_guest(guest)
  end

  describe "GET /issues" do
    context "when unauthenticated" do
      it "returns an array of all issues" 


      it "returns authentication error without any scope" 


      it "returns authentication error when scope is assigned-to-me" 


      it "returns authentication error when scope is created-by-me" 

    end

    context "when authenticated" do
      let(:first_issue) { json_response.first }

      it "returns an array of issues" 


      it 'returns an array of closed issues' 


      it 'returns an array of opened issues' 


      it 'returns an array of all issues' 


      it 'returns issues assigned to me' 


      it 'returns issues assigned to me (kebab-case)' 


      it 'returns issues authored by the given author id' 


      it 'returns issues assigned to the given assignee id' 


      it 'returns issues authored by the given author id and assigned to the given assignee id' 


      it 'returns issues with no assignee' 


      it 'returns issues with no assignee' 


      it 'returns issues with any assignee' 


      it 'returns issues reacted by the authenticated user by the given emoji' 


      it 'returns issues matching given search string for title' 


      it 'returns issues matching given search string for description' 


      context 'filtering before a specific date' do
        let!(:issue2) { create(:issue, project: project, author: user, created_at: Date.new(2000, 1, 1), updated_at: Date.new(2000, 1, 1)) }

        it 'returns issues created before a specific date' 


        it 'returns issues updated before a specific date' 

      end

      context 'filtering after a specific date' do
        let!(:issue2) { create(:issue, project: project, author: user, created_at: 1.week.from_now, updated_at: 1.week.from_now) }

        it 'returns issues created after a specific date' 


        it 'returns issues updated after a specific date' 

      end

      it 'returns an array of labeled issues' 


      it 'returns an array of labeled issues when all labels matches' 


      it 'returns an empty array if no issue matches labels' 


      it 'returns an array of labeled issues matching given state' 


      it 'returns unlabeled issues for "No Label" label' 


      it 'returns an empty array if no issue matches labels and state filters' 


      it 'returns an empty array if no issue matches milestone' 


      it 'returns an empty array if milestone does not exist' 


      it 'returns an array of issues in given milestone' 


      it 'returns an array of issues matching state in milestone' 


      it 'returns an array of issues with no milestone' 


      it 'returns an array of issues found by iids' 


      it 'returns an empty array if iid does not exist' 


      it 'sorts by created_at descending by default' 


      it 'sorts ascending when requested' 


      it 'sorts by updated_at descending when requested' 


      it 'sorts by updated_at ascending when requested' 


      it 'matches V4 response schema' 

    end
  end

  describe "GET /groups/:id/issues" do
    let!(:group)            { create(:group) }
    let!(:group_project)    { create(:project, :public, creator_id: user.id, namespace: group) }
    let!(:group_closed_issue) do
      create :closed_issue,
             author: user,
             assignees: [user],
             project: group_project,
             state: :closed,
             milestone: group_milestone,
             updated_at: 3.hours.ago
    end
    let!(:group_confidential_issue) do
      create :issue,
             :confidential,
             project: group_project,
             author: author,
             assignees: [assignee],
             updated_at: 2.hours.ago
    end
    let!(:group_issue) do
      create :issue,
             author: user,
             assignees: [user],
             project: group_project,
             milestone: group_milestone,
             updated_at: 1.hour.ago,
             title: issue_title,
             description: issue_description
    end
    let!(:group_label) do
      create(:label, title: 'group_lbl', color: '#FFAABB', project: group_project)
    end
    let!(:group_label_link) { create(:label_link, label: group_label, target: group_issue) }
    let!(:group_milestone) { create(:milestone, title: '3.0.0', project: group_project) }
    let!(:group_empty_milestone) do
      create(:milestone, title: '4.0.0', project: group_project)
    end
    let!(:group_note) { create(:note_on_issue, author: user, project: group_project, noteable: group_issue) }

    let(:base_url) { "/groups/#{group.id}/issues" }

    context 'when group has subgroups', :nested_groups do
      let(:subgroup_1) { create(:group, parent: group) }
      let(:subgroup_2) { create(:group, parent: subgroup_1) }

      let(:subgroup_1_project) { create(:project, namespace: subgroup_1) }
      let(:subgroup_2_project) { create(:project, namespace: subgroup_2) }

      let!(:issue_1) { create(:issue, project: subgroup_1_project) }
      let!(:issue_2) { create(:issue, project: subgroup_2_project) }

      before do
        group.add_developer(user)
      end

      it 'also returns subgroups projects issues' 

    end

    context 'when user is unauthenticated' do
      it 'lists all issues in public projects' 

    end

    context 'when user is a group member' do
      before do
        group_project.add_reporter(user)
      end

      it 'returns all group issues (including opened and closed)' 


      it 'returns group issues without confidential issues for non project members' 


      it 'returns group confidential issues for author' 


      it 'returns group confidential issues for assignee' 


      it 'returns group issues with confidential issues for project members' 


      it 'returns group confidential issues for admin' 


      it 'returns an array of labeled group issues' 


      it 'returns an array of labeled group issues where all labels match' 


      it 'returns issues matching given search string for title' 


      it 'returns issues matching given search string for description' 


      it 'returns an array of labeled issues when all labels matches' 


      it 'returns an array of issues found by iids' 


      it 'returns an empty array if iid does not exist' 


      it 'returns an empty array if no group issue matches labels' 


      it 'returns an empty array if no issue matches milestone' 


      it 'returns an empty array if milestone does not exist' 


      it 'returns an array of issues in given milestone' 


      it 'returns an array of issues matching state in milestone' 


      it 'returns an array of issues with no milestone' 


      it 'sorts by created_at descending by default' 


      it 'sorts ascending when requested' 


      it 'sorts by updated_at descending when requested' 


      it 'sorts by updated_at ascending when requested' 

    end
  end

  describe "GET /projects/:id/issues" do
    let(:base_url) { "/projects/#{project.id}" }

    context 'when unauthenticated' do
      it 'returns public project issues' 

    end

    it 'avoids N+1 queries' 


    it 'returns 404 when project does not exist' 


    it "returns 404 on private projects for other users" 


    it 'returns no issues when user has access to project but not issues' 


    it 'returns project issues without confidential issues for non project members' 


    it 'returns project issues without confidential issues for project members with guest role' 


    it 'returns project confidential issues for author' 


    it 'returns project confidential issues for assignee' 


    it 'returns project issues with confidential issues for project members' 


    it 'returns project confidential issues for admin' 


    it 'returns an array of labeled project issues' 


    it 'returns an array of labeled issues when all labels matches' 


    it 'returns issues matching given search string for title' 


    it 'returns issues matching given search string for description' 


    it 'returns an array of issues found by iids' 


    it 'returns an empty array if iid does not exist' 


    it 'returns an empty array if not all labels matches' 


    it 'returns an empty array if no project issue matches labels' 


    it 'returns an empty array if no issue matches milestone' 


    it 'returns an empty array if milestone does not exist' 


    it 'returns an array of issues in given milestone' 


    it 'returns an array of issues matching state in milestone' 


    it 'returns an array of issues with no milestone' 


    it 'returns an array of issues with any milestone' 


    it 'sorts by created_at descending by default' 


    it 'sorts ascending when requested' 


    it 'sorts by updated_at descending when requested' 


    it 'sorts by updated_at ascending when requested' 

  end

  describe "GET /projects/:id/issues/:issue_iid" do
    context 'when unauthenticated' do
      it 'returns public issues' 

    end

    it 'exposes known attributes' 


    it "exposes the 'closed_at' attribute" 


    context 'links exposure' do
      it 'exposes related resources full URIs' 

    end

    it "returns a project issue by internal id" 


    it "returns 404 if issue id not found" 


    it "returns 404 if the issue ID is used" 


    context 'confidential issues' do
      it "returns 404 for non project members" 


      it "returns 404 for project members with guest role" 


      it "returns confidential issue for project members" 


      it "returns confidential issue for author" 


      it "returns confidential issue for assignee" 


      it "returns confidential issue for admin" 

    end
  end

  describe "POST /projects/:id/issues" do
    context 'support for deprecated assignee_id' do
      it 'creates a new project issue' 


      it 'creates a new project issue when assignee_id is empty' 

    end

    context 'single assignee restrictions' do
      it 'creates a new project issue with no more than one assignee' 

    end

    context 'user does not have permissions to create issue' do
      let(:not_member)  { create(:user) }

      before do
        project.project_feature.update(issues_access_level: ProjectFeature::PRIVATE)
      end

      it 'renders 403' 

    end

    context 'an internal ID is provided' do
      context 'by an admin' do
        it 'sets the internal ID on the new issue' 

      end

      context 'by an owner' do
        it 'sets the internal ID on the new issue' 

      end

      context 'by a group owner' do
        let(:group) { create(:group) }
        let(:group_project) { create(:project, :public, namespace: group) }

        it 'sets the internal ID on the new issue' 

      end

      context 'by another user' do
        it 'ignores the given internal ID' 

      end
    end

    it 'creates a new project issue' 


    it 'creates a new confidential project issue' 


    it 'creates a new confidential project issue with a different param' 


    it 'creates a public issue when confidential param is false' 


    it 'creates a public issue when confidential param is invalid' 


    it "returns a 400 bad request if title not given" 


    it 'allows special label names' 


    it 'returns 400 if title is too long' 


    context 'resolving discussions' do
      let(:discussion) { create(:diff_note_on_merge_request).to_discussion }
      let(:merge_request) { discussion.noteable }
      let(:project) { merge_request.source_project }

      before do
        project.add_maintainer(user)
      end

      context 'resolving all discussions in a merge request' do
        before do
          post api("/projects/#{project.id}/issues", user),
               title: 'New Issue',
               merge_request_to_resolve_discussions_of: merge_request.iid
        end

        it_behaves_like 'creating an issue resolving discussions through the API'
      end

      context 'resolving a single discussion' do
        before do
          post api("/projects/#{project.id}/issues", user),
               title: 'New Issue',
               merge_request_to_resolve_discussions_of: merge_request.iid,
               discussion_to_resolve: discussion.id
        end

        it_behaves_like 'creating an issue resolving discussions through the API'
      end
    end

    context 'with due date' do
      it 'creates a new project issue' 

    end

    context 'setting created_at' do
      let(:creation_time) { 2.weeks.ago }
      let(:params) { { title: 'new issue', labels: 'label, label2', created_at: creation_time } }

      context 'by an admin' do
        it 'sets the creation time on the new issue' 

      end

      context 'by a project owner' do
        it 'sets the creation time on the new issue' 

      end

      context 'by a group owner' do
        it 'sets the creation time on the new issue' 

      end

      context 'by another user' do
        it 'ignores the given creation time' 

      end
    end

    context 'the user can only read the issue' do
      it 'cannot create new labels' 

    end
  end

  describe 'POST /projects/:id/issues with spam filtering' do
    before do
      allow_any_instance_of(SpamService).to receive(:check_for_spam?).and_return(true)
      allow_any_instance_of(AkismetService).to receive_messages(spam?: true)
    end

    let(:params) do
      {
        title: 'new issue',
        description: 'content here',
        labels: 'label, label2'
      }
    end

    it "does not create a new project issue" 

  end

  describe "PUT /projects/:id/issues/:issue_iid to update only title" do
    it "updates a project issue" 


    it "returns 404 error if issue iid not found" 


    it "returns 404 error if issue id is used instead of the iid" 


    it 'allows special label names' 


    context 'confidential issues' do
      it "returns 403 for non project members" 


      it "returns 403 for project members with guest role" 


      it "updates a confidential issue for project members" 


      it "updates a confidential issue for author" 


      it "updates a confidential issue for admin" 


      it 'sets an issue to confidential' 


      it 'makes a confidential issue public' 


      it 'does not update a confidential issue with wrong confidential flag' 

    end
  end

  describe 'PUT /projects/:id/issues/:issue_iid with spam filtering' do
    let(:params) do
      {
        title: 'updated title',
        description: 'content here',
        labels: 'label, label2'
      }
    end

    it "does not create a new project issue" 

  end

  describe 'PUT /projects/:id/issues/:issue_iid to update assignee' do
    context 'support for deprecated assignee_id' do
      it 'removes assignee' 


      it 'updates an issue with new assignee' 

    end

    it 'removes assignee' 


    it 'updates an issue with new assignee' 


    context 'single assignee restrictions' do
      it 'updates an issue with several assignees but only one has been applied' 

    end
  end

  describe 'PUT /projects/:id/issues/:issue_iid to update labels' do
    let!(:label) { create(:label, title: 'dummy', project: project) }
    let!(:label_link) { create(:label_link, label: label, target: issue) }

    it 'does not update labels if not present' 


    it 'removes all labels and touches the record' 


    it 'updates labels and touches the record' 


    it 'allows special label names' 


    it 'returns 400 if title is too long' 

  end

  describe "PUT /projects/:id/issues/:issue_iid to update state and label" do
    it "updates a project issue" 


    it 'reopens a project isssue' 


    context 'when an admin or owner makes the request' do
      it 'accepts the update date to be set' 

    end
  end

  describe 'PUT /projects/:id/issues/:issue_iid to update due date' do
    it 'creates a new project issue' 

  end

  describe "DELETE /projects/:id/issues/:issue_iid" do
    it "rejects a non member from deleting an issue" 


    it "rejects a developer from deleting an issue" 


    context "when the user is project owner" do
      let(:owner)     { create(:user) }
      let(:project)   { create(:project, namespace: owner.namespace) }

      it "deletes the issue if an admin requests it" 


      it_behaves_like '412 response' do
        let(:request) { api("/projects/#{project.id}/issues/#{issue.iid}", owner) }
      end
    end

    context 'when issue does not exist' do
      it 'returns 404 when trying to move an issue' 

    end

    it 'returns 404 when using the issue ID instead of IID' 

  end

  describe '/projects/:id/issues/:issue_iid/move' do
    let!(:target_project) { create(:project, creator_id: user.id, namespace: user.namespace ) }
    let!(:target_project2) { create(:project, creator_id: non_member.id, namespace: non_member.namespace ) }

    it 'moves an issue' 


    context 'when source and target projects are the same' do
      it 'returns 400 when trying to move an issue' 

    end

    context 'when the user does not have the permission to move issues' do
      it 'returns 400 when trying to move an issue' 

    end

    it 'moves the issue to another namespace if I am admin' 


    context 'when using the issue ID instead of iid' do
      it 'returns 404 when trying to move an issue' 

    end

    context 'when issue does not exist' do
      it 'returns 404 when trying to move an issue' 

    end

    context 'when source project does not exist' do
      it 'returns 404 when trying to move an issue' 

    end

    context 'when target project does not exist' do
      it 'returns 404 when trying to move an issue' 

    end
  end

  describe 'POST :id/issues/:issue_iid/subscribe' do
    it 'subscribes to an issue' 


    it 'returns 304 if already subscribed' 


    it 'returns 404 if the issue is not found' 


    it 'returns 404 if the issue ID is used instead of the iid' 


    it 'returns 404 if the issue is confidential' 

  end

  describe 'POST :id/issues/:issue_id/unsubscribe' do
    it 'unsubscribes from an issue' 


    it 'returns 304 if not subscribed' 


    it 'returns 404 if the issue is not found' 


    it 'returns 404 if using the issue ID instead of iid' 


    it 'returns 404 if the issue is confidential' 

  end

  describe 'time tracking endpoints' do
    let(:issuable) { issue }

    include_examples 'time tracking endpoints', 'issue'
  end

  describe 'GET :id/issues/:issue_iid/closed_by' do
    let(:merge_request) do
      create(:merge_request,
             :simple,
             author: user,
             source_project: project,
             target_project: project,
             description: "closes #{issue.to_reference}")
    end

    before do
      create(:merge_requests_closing_issues, issue: issue, merge_request: merge_request)
    end

    context 'when unauthenticated' do
      it 'return public project issues' 

    end

    it 'returns merge requests that will close issue on merge' 


    context 'when no merge requests will close issue' do
      it 'returns empty array' 

    end

    it "returns 404 when issue doesn't exists" 

  end

  describe "GET /projects/:id/issues/:issue_iid/user_agent_detail" do
    let!(:user_agent_detail) { create(:user_agent_detail, subject: issue) }

    context 'when unauthenticated' do
      it "returns unauthorized" 

    end

    it 'exposes known attributes' 


    it "returns unauthorized for non-admin users" 

  end

  def expect_paginated_array_response(size: nil)
    expect(response).to have_gitlab_http_status(200)
    expect(response).to include_pagination_headers
    expect(json_response).to be_an Array
    expect(json_response.length).to eq(size) if size
  end

  describe 'GET projects/:id/issues/:issue_iid/participants' do
    it_behaves_like 'issuable participants endpoint' do
      let(:entity) { issue }
    end

    it 'returns 404 if the issue is confidential' 

  end
end

