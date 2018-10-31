require 'spec_helper'

describe API::V3::Todos do
  let(:project_1) { create(:project) }
  let(:project_2) { create(:project) }
  let(:author_1) { create(:user) }
  let(:author_2) { create(:user) }
  let(:john_doe) { create(:user, username: 'john_doe') }
  let!(:pending_1) { create(:todo, :mentioned, project: project_1, author: author_1, user: john_doe) }
  let!(:pending_2) { create(:todo, project: project_2, author: author_2, user: john_doe) }
  let!(:pending_3) { create(:todo, project: project_1, author: author_2, user: john_doe) }
  let!(:done) { create(:todo, :done, project: project_1, author: author_1, user: john_doe) }

  before do
    project_1.add_developer(john_doe)
    project_2.add_developer(john_doe)
  end

  describe 'DELETE /todos/:id' do
    context 'when unauthenticated' do
      it 'returns authentication error' 

    end

    context 'when authenticated' do
      it 'marks a todo as done' 


      it 'updates todos cache' 


      it 'returns 404 if the todo does not belong to the current user' 

    end
  end

  describe 'DELETE /todos' do
    context 'when unauthenticated' do
      it 'returns authentication error' 

    end

    context 'when authenticated' do
      it 'marks all todos as done' 


      it 'updates todos cache' 

    end
  end
end

