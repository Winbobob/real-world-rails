require 'spec_helper'

describe Dashboard::TodosController do
  let(:user) { create(:user) }
  let(:author)  { create(:user) }
  let(:project) { create(:project) }
  let(:todo_service) { TodoService.new }

  before do
    sign_in(user)
    project.add_developer(user)
  end

  describe 'GET #index' do
    context 'project authorization' do
      it 'renders 404 when user does not have read access on given project' 


      it 'renders 404 when given project does not exists' 


      it 'renders 200 when filtering for "any project" todos' 


      it 'renders 200 when user has access on given project' 

    end

    context 'when using pagination' do
      let(:last_page) { user.todos.page.total_pages }
      let!(:issues) { create_list(:issue, 3, project: project, assignees: [user]) }

      before do
        issues.each { |issue| todo_service.new_issue(issue, user) }
        allow(Kaminari.config).to receive(:default_per_page).and_return(2)
      end

      it 'redirects to last_page if page number is larger than number of pages' 


      it 'goes to the correct page' 


      it 'does not redirect to external sites when provided a host field' 


      context 'when providing no filters' do
        it 'does not perform a query to get the page count, but gets that from the user' 

      end

      context 'when providing filters' do
        it 'performs a query to get the correct page count' 

      end
    end
  end

  describe 'PATCH #restore' do
    let(:todo) { create(:todo, :done, user: user, project: project, author: author) }

    it 'restores the todo to pending state' 

  end

  describe 'PATCH #bulk_restore' do
    let(:todos) { create_list(:todo, 2, :done, user: user, project: project, author: author) }

    it 'restores the todos to pending state' 

  end
end

