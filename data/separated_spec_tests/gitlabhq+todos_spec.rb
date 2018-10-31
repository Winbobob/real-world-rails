require 'spec_helper'

describe API::Todos do
  let(:group)     { create(:group) }
  let(:project_1) { create(:project, :repository, group: group) }
  let(:project_2) { create(:project) }
  let(:author_1) { create(:user) }
  let(:author_2) { create(:user) }
  let(:john_doe) { create(:user, username: 'john_doe') }
  let(:merge_request) { create(:merge_request, source_project: project_1) }
  let!(:pending_1) { create(:todo, :mentioned, project: project_1, author: author_1, user: john_doe) }
  let!(:pending_2) { create(:todo, project: project_2, author: author_2, user: john_doe) }
  let!(:pending_3) { create(:on_commit_todo, project: project_1, author: author_2, user: john_doe) }
  let!(:done) { create(:todo, :done, project: project_1, author: author_1, user: john_doe) }

  before do
    project_1.add_developer(john_doe)
    project_2.add_developer(john_doe)
  end

  describe 'GET /todos' do
    context 'when unauthenticated' do
      it 'returns authentication error' 

    end

    context 'when authenticated' do
      it 'returns an array of pending todos for current user' 


      context 'and using the author filter' do
        it 'filters based on author_id param' 

      end

      context 'and using the type filter' do
        it 'filters based on type param' 

      end

      context 'and using the state filter' do
        it 'filters based on state param' 

      end

      context 'and using the project filter' do
        it 'filters based on project_id param' 

      end

      context 'and using the group filter' do
        it 'filters based on project_id param' 

      end

      context 'and using the action filter' do
        it 'filters based on action param' 

      end
    end
  end

  describe 'POST /todos/:id/mark_as_done' do
    context 'when unauthenticated' do
      it 'returns authentication error' 

    end

    context 'when authenticated' do
      it 'marks a todo as done' 


      it 'updates todos cache' 


      it 'returns 404 if the todo does not belong to the current user' 

    end
  end

  describe 'POST /mark_as_done' do
    context 'when unauthenticated' do
      it 'returns authentication error' 

    end

    context 'when authenticated' do
      it 'marks all todos as done' 


      it 'updates todos cache' 

    end
  end

  shared_examples 'an issuable' do |issuable_type|
    it 'creates a todo on an issuable' 


    it 'returns 304 there already exist a todo on that issuable' 


    it 'returns 404 if the issuable is not found' 


    it 'returns an error if the issuable is not accessible' 

  end

  describe 'POST :id/issuable_type/:issueable_id/todo' do
    context 'for an issue' do
      it_behaves_like 'an issuable', 'issues' do
        let(:issuable) { create(:issue, :confidential, author: author_1, project: project_1) }
      end
    end

    context 'for a merge request' do
      it_behaves_like 'an issuable', 'merge_requests' do
        let(:issuable) { merge_request }
      end
    end
  end
end

