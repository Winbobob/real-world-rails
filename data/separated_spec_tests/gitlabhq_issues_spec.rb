require 'spec_helper'

describe API::V3::Issues do
  set(:user)        { create(:user) }
  set(:user2)       { create(:user) }
  set(:non_member)  { create(:user) }
  set(:guest)       { create(:user) }
  set(:author)      { create(:author) }
  set(:assignee)    { create(:assignee) }
  set(:admin)       { create(:user, :admin) }
  let!(:project)    { create(:project, :public, creator_id: user.id, namespace: user.namespace ) }
  let!(:closed_issue) do
    create :closed_issue,
           author: user,
           assignees: [user],
           project: project,
           state: :closed,
           milestone: milestone,
           created_at: generate(:past_time),
           updated_at: 3.hours.ago
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
           updated_at: 1.hour.ago
  end
  let!(:label) do
    create(:label, title: 'label', color: '#FFAABB', project: project)
  end
  let!(:label_link) { create(:label_link, label: label, target: issue) }
  let!(:milestone) { create(:milestone, title: '1.0.0', project: project) }
  let!(:empty_milestone) do
    create(:milestone, title: '2.0.0', project: project)
  end
  let!(:note) { create(:note_on_issue, author: user, project: project, noteable: issue) }

  let(:no_milestone_title) { URI.escape(Milestone::None.title) }

  before do
    project.add_reporter(user)
    project.add_guest(guest)
  end

  describe "GET /issues" do
    context "when unauthenticated" do
      it "returns authentication error" 

    end

    context "when authenticated" do
      it "returns an array of issues" 


      it 'returns an array of closed issues' 


      it 'returns an array of opened issues' 


      it 'returns an array of all issues' 


      it 'returns an array of labeled issues' 


      it 'returns an array of labeled issues when at least one label matches' 


      it 'returns an empty array if no issue matches labels' 


      it 'returns an array of labeled issues matching given state' 


      it 'returns an empty array if no issue matches labels and state filters' 


      it 'returns an empty array if no issue matches milestone' 


      it 'returns an empty array if milestone does not exist' 


      it 'returns an array of issues in given milestone' 


      it 'returns an array of issues matching state in milestone' 


      it 'returns an array of issues with no milestone' 


      it 'sorts by created_at descending by default' 


      it 'sorts ascending when requested' 


      it 'sorts by updated_at descending when requested' 


      it 'sorts by updated_at ascending when requested' 


      it 'matches V3 response schema' 

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
             updated_at: 1.hour.ago
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

    before do
      group_project.add_reporter(user)
    end
    let(:base_url) { "/groups/#{group.id}/issues" }

    it 'returns all group issues (including opened and closed)' 


    it 'returns group issues without confidential issues for non project members' 


    it 'returns group confidential issues for author' 


    it 'returns group confidential issues for assignee' 


    it 'returns group issues with confidential issues for project members' 


    it 'returns group confidential issues for admin' 


    it 'returns an array of labeled group issues' 


    it 'returns an array of labeled group issues where all labels match' 


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

  describe "GET /projects/:id/issues" do
    let(:base_url) { "/projects/#{project.id}" }

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


    it 'returns an array of labeled project issues where all labels match' 


    it 'returns an empty array if no project issue matches labels' 


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

  describe "GET /projects/:id/issues/:issue_id" do
    it 'exposes known attributes' 


    it "returns a project issue by id" 


    it 'returns a project issue by iid' 


    it 'returns an empty array for an unknown project issue iid' 


    it "returns 404 if issue id not found" 


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
    it 'creates a new project issue' 


    it 'creates a new confidential project issue' 


    it 'creates a new confidential project issue with a different param' 


    it 'creates a public issue when confidential param is false' 


    it 'creates a public issue when confidential param is invalid' 


    it "returns a 400 bad request if title not given" 


    it 'allows special label names' 


    it 'returns 400 if title is too long' 


    context 'resolving issues in a merge request' do
      set(:diff_note_on_merge_request) { create(:diff_note_on_merge_request) }
      let(:discussion) { diff_note_on_merge_request.to_discussion }
      let(:merge_request) { discussion.noteable }
      let(:project) { merge_request.source_project }
      before do
        project.add_master(user)
        post v3_api("/projects/#{project.id}/issues", user),
             title: 'New Issue',
             merge_request_for_resolving_discussions: merge_request.iid
      end

      it 'creates a new project issue' 


      it 'resolves the discussions in a merge request' 


      it 'assigns a description to the issue mentioning the merge request' 

    end

    context 'with due date' do
      it 'creates a new project issue' 

    end

    context 'when an admin or owner makes the request' do
      it 'accepts the creation date to be set' 

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

  describe "PUT /projects/:id/issues/:issue_id to update only title" do
    it "updates a project issue" 


    it "returns 404 error if issue id not found" 


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

  describe 'PUT /projects/:id/issues/:issue_id with spam filtering' do
    let(:params) do
      {
        title: 'updated title',
        description: 'content here',
        labels: 'label, label2'
      }
    end

    it "does not create a new project issue" 

  end

  describe 'PUT /projects/:id/issues/:issue_id to update labels' do
    let!(:label) { create(:label, title: 'dummy', project: project) }
    let!(:label_link) { create(:label_link, label: label, target: issue) }

    it 'does not update labels if not present' 


    it 'removes all labels' 


    it 'updates labels' 


    it 'allows special label names' 


    it 'returns 400 if title is too long' 

  end

  describe "PUT /projects/:id/issues/:issue_id to update state and label" do
    it "updates a project issue" 


    it 'reopens a project isssue' 


    context 'when an admin or owner makes the request' do
      it 'accepts the update date to be set' 

    end
  end

  describe 'PUT /projects/:id/issues/:issue_id to update due date' do
    it 'creates a new project issue' 

  end

  describe 'PUT /projects/:id/issues/:issue_id to update assignee' do
    it 'updates an issue with no assignee' 


    it 'updates an issue with assignee' 

  end

  describe "DELETE /projects/:id/issues/:issue_id" do
    it "rejects a non member from deleting an issue" 


    it "rejects a developer from deleting an issue" 


    context "when the user is project owner" do
      set(:owner)     { create(:user) }
      let(:project)   { create(:project, namespace: owner.namespace) }

      it "deletes the issue if an admin requests it" 

    end

    context 'when issue does not exist' do
      it 'returns 404 when trying to move an issue' 

    end
  end

  describe '/projects/:id/issues/:issue_id/move' do
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

  describe 'POST :id/issues/:issue_id/subscription' do
    it 'subscribes to an issue' 


    it 'returns 304 if already subscribed' 


    it 'returns 404 if the issue is not found' 


    it 'returns 404 if the issue is confidential' 

  end

  describe 'DELETE :id/issues/:issue_id/subscription' do
    it 'unsubscribes from an issue' 


    it 'returns 304 if not subscribed' 


    it 'returns 404 if the issue is not found' 


    it 'returns 404 if the issue is confidential' 

  end

  describe 'time tracking endpoints' do
    let(:issuable) { issue }

    include_examples 'V3 time tracking endpoints', 'issue'
  end
end

