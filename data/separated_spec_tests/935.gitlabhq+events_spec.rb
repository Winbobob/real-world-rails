require 'spec_helper'

describe API::Events do
  include ApiHelpers

  let(:user) { create(:user) }
  let(:non_member) { create(:user) }
  let(:private_project) { create(:project, :private, creator_id: user.id, namespace: user.namespace) }
  let(:closed_issue) { create(:closed_issue, project: private_project, author: user) }
  let!(:closed_issue_event) { create(:event, project: private_project, author: user, target: closed_issue, action: Event::CLOSED, created_at: Date.new(2016, 12, 30)) }

  describe 'GET /events' do
    context 'when unauthenticated' do
      it 'returns authentication error' 

    end

    context 'when authenticated' do
      it 'returns users events' 

    end

    context 'when the requesting token has "read_user" scope' do
      let(:token) { create(:personal_access_token, scopes: ['read_user'], user: user) }

      it 'returns users events' 

    end

    context 'when the requesting token does not have "read_user" or "api" scope' do
      let(:token_without_scopes) { create(:personal_access_token, scopes: ['read_repository'], user: user) }

      it 'returns a "403" response' 

    end
  end

  describe 'GET /users/:id/events' do
    context "as a user that cannot see another user" do
      it 'returns a "404" response' 

    end

    context "as a user token that cannot see another user" do
      let(:non_member_token) { create(:personal_access_token, scopes: ['read_user'], user: non_member) }

      it 'returns a "404" response' 

    end

    context "as a user that can see the event's project" do
      it 'accepts a username' 


      it 'returns the events' 


      context 'when the list of events includes push events' do
        let(:event) do
          create(:push_event, author: user, project: private_project)
        end

        let!(:payload) { create(:push_event_payload, event: event) }
        let(:payload_hash) { json_response[0]['push_data'] }

        before do
          get api("/users/#{user.id}/events?action=pushed", user)
        end

        it 'responds with HTTP 200 OK' 


        it 'includes the push payload as a Hash' 


        it 'includes the push payload details' 

      end

      context 'when there are multiple events from different projects' do
        let(:second_note) { create(:note_on_issue, project: create(:project)) }

        before do
          second_note.project.add_user(user, :developer)

          [second_note].each do |note|
            EventCreateService.new.leave_note(note, user)
          end
        end

        it 'returns events in the correct order (from newest to oldest)' 


        it 'accepts filter parameters' 

      end
    end

    it 'returns a 404 error if not found' 

  end

  describe 'GET /projects/:id/events' do
    context 'when unauthenticated ' do
      it 'returns 404 for private project' 


      it 'returns 200 status for a public project' 

    end

    context 'when not permitted to read' do
      it 'returns 404' 

    end

    context 'when authenticated' do
      it 'returns project events' 


      it 'returns 404 if project does not exist' 

    end

    context 'when exists some events' do
      let(:merge_request1) { create(:merge_request, :closed, author: user, assignee: user, source_project: private_project, title: 'Test') }
      let(:merge_request2) { create(:merge_request, :closed, author: user, assignee: user, source_project: private_project, title: 'Test') }

      before do
        create_event(merge_request1)
      end

      it 'avoids N+1 queries' 


      def create_event(target)
        create(:event, project: private_project, author: user, target: target)
      end
    end
  end
end

