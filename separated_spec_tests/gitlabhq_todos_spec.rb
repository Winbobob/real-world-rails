require 'spec_helper'

feature 'Dashboard Todos' do
  let(:user)    { create(:user) }
  let(:author)  { create(:user) }
  let(:project) { create(:project, :public) }
  let(:issue)   { create(:issue, due_date: Date.today) }

  context 'User does not have todos' do
    before do
      sign_in(user)
      visit dashboard_todos_path
    end

    it 'shows "All done" message' 

  end

  context 'User has a todo', :js do
    before do
      create(:todo, :mentioned, user: user, project: project, target: issue, author: author)
      sign_in(user)

      visit dashboard_todos_path
    end

    it 'has todo present' 


    it 'shows due date as today' 


    shared_examples 'deleting the todo' do
      before do
        within first('.todo') do
          click_link 'Done'
        end
      end

      it 'is marked as done-reversible in the list' 


      it 'shows Undo button' 


      it 'updates todo count' 


      it 'has not "All done" message' 

    end

    shared_examples 'deleting and restoring the todo' do
      before do
        within first('.todo') do
          click_link 'Done'
          wait_for_requests
          click_link 'Undo'
        end
      end

      it 'is marked back as pending in the list' 


      it 'shows Done button' 


      it 'updates todo count' 

    end

    it_behaves_like 'deleting the todo'
    it_behaves_like 'deleting and restoring the todo'

    context 'todo is stale on the page' do
      before do
        todos = TodosFinder.new(user, state: :pending).execute
        TodoService.new.mark_todos_as_done(todos, user)
      end

      it_behaves_like 'deleting the todo'
      it_behaves_like 'deleting and restoring the todo'
    end
  end

  context 'User created todos for themself' do
    before do
      sign_in(user)
    end

    context 'issue assigned todo' do
      before do
        create(:todo, :assigned, user: user, project: project, target: issue, author: user)
        visit dashboard_todos_path
      end

      it 'shows issue assigned to yourself message' 

    end

    context 'marked todo' do
      before do
        create(:todo, :marked, user: user, project: project, target: issue, author: user)
        visit dashboard_todos_path
      end

      it 'shows you added a todo message' 

    end

    context 'mentioned todo' do
      before do
        create(:todo, :mentioned, user: user, project: project, target: issue, author: user)
        visit dashboard_todos_path
      end

      it 'shows you mentioned yourself message' 

    end

    context 'directly_addressed todo' do
      before do
        create(:todo, :directly_addressed, user: user, project: project, target: issue, author: user)
        visit dashboard_todos_path
      end

      it 'shows you directly addressed yourself message' 

    end

    context 'approval todo' do
      let(:merge_request) { create(:merge_request) }

      before do
        create(:todo, :approval_required, user: user, project: project, target: merge_request, author: user)
        visit dashboard_todos_path
      end

      it 'shows you set yourself as an approver message' 

    end
  end

  context 'User has done todos', :js do
    before do
      create(:todo, :mentioned, :done, user: user, project: project, target: issue, author: author)
      sign_in(user)
      visit dashboard_todos_path(state: :done)
    end

    it 'has the done todo present' 


    describe 'restoring the todo' do
      before do
        within first('.todo') do
          click_link 'Add todo'
        end
      end

      it 'is removed from the list' 


      it 'updates todo count' 

    end
  end

  context 'User has Todos with labels spanning multiple projects' do
    before do
      label1 = create(:label, project: project)
      note1 = create(:note_on_issue, note: "Hello #{label1.to_reference(format: :name)}", noteable_id: issue.id, noteable_type: 'Issue', project: issue.project)
      create(:todo, :mentioned, project: project, target: issue, user: user, note_id: note1.id)

      project2 = create(:project, :public)
      label2 = create(:label, project: project2)
      issue2 = create(:issue, project: project2)
      note2 = create(:note_on_issue, note: "Test #{label2.to_reference(format: :name)}", noteable_id: issue2.id, noteable_type: 'Issue', project: project2)
      create(:todo, :mentioned, project: project2, target: issue2, user: user, note_id: note2.id)

      gitlab_sign_in(user)
      visit dashboard_todos_path
    end

    it 'shows page with two Todos' 

  end

  context 'User has multiple pages of Todos' do
    before do
      allow(Todo).to receive(:default_per_page).and_return(1)

      # Create just enough records to cause us to paginate
      create_list(:todo, 2, :mentioned, user: user, project: project, target: issue, author: author)

      sign_in(user)
    end

    it 'is paginated' 


    it 'is has the right number of pages' 


    describe 'mark all as done', :js do
      before do
        visit dashboard_todos_path
        find('.js-todos-mark-all').click
      end

      it 'shows "All done" message!' 


      it 'shows "Undo mark all as done" button' 

    end

    describe 'undo mark all as done', :js do
      before do
        visit dashboard_todos_path
      end

      it 'shows the restored todo list' 


      it 'updates todo count' 


      it 'shows "Mark all as done" button' 


      context 'User has deleted a todo' do
        before do
          within first('.todo') do
            click_link 'Done'
          end
        end

        it 'shows the restored todo list with the deleted todo' 

      end

      def mark_all_and_undo
        find('.js-todos-mark-all').click
        wait_for_requests
        find('.js-todos-undo-all').click
        wait_for_requests
      end
    end
  end

  context 'User has a Build Failed todo' do
    let!(:todo) { create(:todo, :build_failed, user: user, project: project, author: author) }

    before do
      sign_in(user)
      visit dashboard_todos_path
    end

    it 'shows the todo' 


    it 'links to the pipelines for the merge request' 

  end
end

