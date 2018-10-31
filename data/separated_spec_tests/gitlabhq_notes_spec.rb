require 'spec_helper'

describe API::V3::Notes do
  let(:user) { create(:user) }
  let!(:project) { create(:project, :public, namespace: user.namespace) }
  let!(:issue) { create(:issue, project: project, author: user) }
  let!(:merge_request) { create(:merge_request, source_project: project, target_project: project, author: user) }
  let!(:snippet) { create(:project_snippet, project: project, author: user) }
  let!(:issue_note) { create(:note, noteable: issue, project: project, author: user) }
  let!(:merge_request_note) { create(:note, noteable: merge_request, project: project, author: user) }
  let!(:snippet_note) { create(:note, noteable: snippet, project: project, author: user) }

  # For testing the cross-reference of a private issue in a public issue
  let(:private_user)    { create(:user) }
  let(:private_project) do
    create(:project, namespace: private_user.namespace)
    .tap { |p| p.add_master(private_user) }
  end
  let(:private_issue)    { create(:issue, project: private_project) }

  let(:ext_proj)  { create(:project, :public) }
  let(:ext_issue) { create(:issue, project: ext_proj) }

  let!(:cross_reference_note) do
    create :note,
    noteable: ext_issue, project: ext_proj,
    note: "mentioned in issue #{private_issue.to_reference(ext_proj)}",
    system: true
  end

  before { project.add_reporter(user) }

  describe "GET /projects/:id/noteable/:noteable_id/notes" do
    context "when noteable is an Issue" do
      it "returns an array of issue notes" 


      it "returns a 404 error when issue id not found" 


      context "and current user cannot view the notes" do
        it "returns an empty array" 


        context "and issue is confidential" do
          before { ext_issue.update_attributes(confidential: true) }

          it "returns 404" 

        end

        context "and current user can view the note" do
          it "returns an empty array" 

        end
      end
    end

    context "when noteable is a Snippet" do
      it "returns an array of snippet notes" 


      it "returns a 404 error when snippet id not found" 


      it "returns 404 when not authorized" 

    end

    context "when noteable is a Merge Request" do
      it "returns an array of merge_requests notes" 


      it "returns a 404 error if merge request id not found" 


      it "returns 404 when not authorized" 

    end
  end

  describe "GET /projects/:id/noteable/:noteable_id/notes/:note_id" do
    context "when noteable is an Issue" do
      it "returns an issue note by id" 


      it "returns a 404 error if issue note not found" 


      context "and current user cannot view the note" do
        it "returns a 404 error" 


        context "when issue is confidential" do
          before { issue.update_attributes(confidential: true) }

          it "returns 404" 

        end

        context "and current user can view the note" do
          it "returns an issue note by id" 

        end
      end
    end

    context "when noteable is a Snippet" do
      it "returns a snippet note by id" 


      it "returns a 404 error if snippet note not found" 

    end
  end

  describe "POST /projects/:id/noteable/:noteable_id/notes" do
    context "when noteable is an Issue" do
      it "creates a new issue note" 


      it "returns a 400 bad request error if body not given" 


      it "returns a 401 unauthorized error if user not authenticated" 


      context 'when an admin or owner makes the request' do
        it 'accepts the creation date to be set' 

      end

      context 'when the user is posting an award emoji on an issue created by someone else' do
        let(:issue2) { create(:issue, project: project) }

        it 'creates a new issue note' 

      end

      context 'when the user is posting an award emoji on his/her own issue' do
        it 'creates a new issue note' 

      end
    end

    context "when noteable is a Snippet" do
      it "creates a new snippet note" 


      it "returns a 400 bad request error if body not given" 


      it "returns a 401 unauthorized error if user not authenticated" 

    end

    context 'when user does not have access to read the noteable' do
      it 'responds with 404' 

    end

    context 'when user does not have access to create noteable' do
      let(:private_issue) { create(:issue, project: create(:project, :private)) }

      ##
      # We are posting to project user has access to, but we use issue id
      # from a different project, see #15577
      #
      before do
        post v3_api("/projects/#{project.id}/issues/#{private_issue.id}/notes", user),
             body: 'Hi!'
      end

      it 'responds with resource not found error' 


      it 'does not create new note' 

    end
  end

  describe "POST /projects/:id/noteable/:noteable_id/notes to test observer on create" do
    it "creates an activity event when an issue note is created" 

  end

  describe 'PUT /projects/:id/noteable/:noteable_id/notes/:note_id' do
    context 'when noteable is an Issue' do
      it 'returns modified note' 


      it 'returns a 404 error when note id not found' 


      it 'returns a 400 bad request error if body not given' 

    end

    context 'when noteable is a Snippet' do
      it 'returns modified note' 


      it 'returns a 404 error when note id not found' 

    end

    context 'when noteable is a Merge Request' do
      it 'returns modified note' 


      it 'returns a 404 error when note id not found' 

    end
  end

  describe 'DELETE /projects/:id/noteable/:noteable_id/notes/:note_id' do
    context 'when noteable is an Issue' do
      it 'deletes a note' 


      it 'returns a 404 error when note id not found' 

    end

    context 'when noteable is a Snippet' do
      it 'deletes a note' 


      it 'returns a 404 error when note id not found' 

    end

    context 'when noteable is a Merge Request' do
      it 'deletes a note' 


      it 'returns a 404 error when note id not found' 

    end
  end
end

