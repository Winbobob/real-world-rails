require 'spec_helper'

describe TodoService do
  let(:author) { create(:user) }
  let(:assignee) { create(:user) }
  let(:non_member) { create(:user) }
  let(:member) { create(:user) }
  let(:guest) { create(:user) }
  let(:admin) { create(:admin) }
  let(:john_doe) { create(:user) }
  let(:skipped) { create(:user) }
  let(:skip_users) { [skipped] }
  let(:project) { create(:project) }
  let(:mentions) { 'FYI: ' + [author, assignee, john_doe, member, guest, non_member, admin, skipped].map(&:to_reference).join(' ') }
  let(:directly_addressed) { [author, assignee, john_doe, member, guest, non_member, admin, skipped].map(&:to_reference).join(' ') }
  let(:directly_addressed_and_mentioned) { member.to_reference + ", what do you think? cc: " + [guest, admin, skipped].map(&:to_reference).join(' ') }
  let(:service) { described_class.new }

  before do
    project.add_guest(guest)
    project.add_developer(author)
    project.add_developer(member)
    project.add_developer(john_doe)
    project.add_developer(skipped)
  end

  describe 'Issues' do
    let(:issue) { create(:issue, project: project, assignees: [john_doe], author: author, description: "- [ ] Task 1\n- [ ] Task 2 #{mentions}") }
    let(:addressed_issue) { create(:issue, project: project, assignees: [john_doe], author: author, description: "#{directly_addressed}\n- [ ] Task 1\n- [ ] Task 2") }
    let(:unassigned_issue) { create(:issue, project: project, assignees: []) }
    let(:confidential_issue) { create(:issue, :confidential, project: project, author: author, assignees: [assignee], description: mentions) }
    let(:addressed_confident_issue) { create(:issue, :confidential, project: project, author: author, assignees: [assignee], description: directly_addressed) }

    describe '#new_issue' do
      it 'creates a todo if assigned' 


      it 'does not create a todo if unassigned' 


      it 'creates a todo if assignee is the current user' 


      it 'creates a todo for each valid mentioned user' 


      it 'creates a directly addressed todo for each valid addressed user' 


      it 'creates correct todos for each valid user based on the type of mention' 


      it 'does not create todo if user can not see the issue when issue is confidential' 


      it 'does not create directly addressed todo if user cannot see the issue when issue is confidential' 


      context 'when a private group is mentioned' do
        let(:group)   { create(:group, :private) }
        let(:project) { create(:project, :private, group: group) }
        let(:issue)   { create(:issue, author: author, project: project, description: group.to_reference) }

        before do
          group.add_owner(author)
          group.add_user(member, Gitlab::Access::DEVELOPER)
          group.add_user(john_doe, Gitlab::Access::DEVELOPER)

          service.new_issue(issue, author)
        end

        it 'creates a todo for group members' 

      end
    end

    describe '#update_issue' do
      it 'creates a todo for each valid mentioned user not included in skip_users' 


      it 'creates a todo for each valid user not included in skip_users based on the type of mention' 


      it 'creates a directly addressed todo for each valid addressed user not included in skip_users' 


      it 'does not create a todo if user was already mentioned and todo is pending' 


      it 'does not create a todo if user was already mentioned and todo is done' 


      it 'does not create a directly addressed todo if user was already mentioned or addressed and todo is pending' 


      it 'does not create a directly addressed todo if user was already mentioned or addressed and todo is done' 


      it 'does not create todo if user can not see the issue when issue is confidential' 


      it 'does not create a directly addressed todo if user can not see the issue when issue is confidential' 


      context 'issues with a task list' do
        it 'does not create todo when tasks are marked as completed' 


        it 'does not create directly addressed todo when tasks are marked as completed' 


        it 'does not raise an error when description not change' 

      end
    end

    describe '#close_issue' do
      it 'marks related pending todos to the target for the user as done' 

    end

    describe '#destroy_target' do
      it 'refreshes the todos count cache for users with todos on the target' 


      it 'does not refresh the todos count cache for users with only done todos on the target' 


      it 'yields the target to the caller' 

    end

    describe '#reassigned_issue' do
      it 'creates a pending todo for new assignee' 


      it 'does not create a todo if unassigned' 


      it 'creates a todo if new assignee is the current user' 

    end

    describe '#mark_pending_todos_as_done' do
      it 'marks related pending todos to the target for the user as done' 


      describe 'cached counts' do
        it 'updates when todos change' 

      end
    end

    shared_examples 'updating todos state' do |meth, state, new_state|
      let!(:first_todo) { create(:todo, state, user: john_doe, project: project, target: issue, author: author) }
      let!(:second_todo) { create(:todo, state, user: john_doe, project: project, target: issue, author: author) }

      it 'updates related todos for the user with the new_state' 


      it 'returns the updated ids' 


      describe 'cached counts' do
        it 'updates when todos change' 

      end
    end

    describe '#mark_todos_as_done' do
      it_behaves_like 'updating todos state', :mark_todos_as_done, :pending, :done do
        let(:collection) { Todo.all }
      end
    end

    describe '#mark_todos_as_done_by_ids' do
      it_behaves_like 'updating todos state', :mark_todos_as_done_by_ids, :pending, :done do
        let(:collection) { [first_todo, second_todo].map(&:id) }
      end
    end

    describe '#mark_todos_as_pending' do
      it_behaves_like 'updating todos state', :mark_todos_as_pending, :done, :pending do
        let(:collection) { Todo.all }
      end
    end

    describe '#mark_todos_as_pending_by_ids' do
      it_behaves_like 'updating todos state', :mark_todos_as_pending_by_ids, :done, :pending do
        let(:collection) { [first_todo, second_todo].map(&:id) }
      end
    end

    describe '#new_note' do
      let!(:first_todo) { create(:todo, :assigned, user: john_doe, project: project, target: issue, author: author) }
      let!(:second_todo) { create(:todo, :assigned, user: john_doe, project: project, target: issue, author: author) }
      let(:confidential_issue) { create(:issue, :confidential, project: project, author: author, assignees: [assignee]) }
      let(:note) { create(:note, project: project, noteable: issue, author: john_doe, note: mentions) }
      let(:addressed_note) { create(:note, project: project, noteable: issue, author: john_doe, note: directly_addressed) }
      let(:note_on_commit) { create(:note_on_commit, project: project, author: john_doe, note: mentions) }
      let(:addressed_note_on_commit) { create(:note_on_commit, project: project, author: john_doe, note: directly_addressed) }
      let(:note_on_confidential_issue) { create(:note_on_issue, noteable: confidential_issue, project: project, note: mentions) }
      let(:addressed_note_on_confidential_issue) { create(:note_on_issue, noteable: confidential_issue, project: project, note: directly_addressed) }
      let(:note_on_project_snippet) { create(:note_on_project_snippet, project: project, author: john_doe, note: mentions) }
      let(:system_note) { create(:system_note, project: project, noteable: issue) }

      it 'mark related pending todos to the noteable for the note author as done' 


      it 'does not mark related pending todos it is a system note' 


      it 'creates a todo for each valid mentioned user' 


      it 'creates a todo for each valid user based on the type of mention' 


      it 'creates a directly addressed todo for each valid addressed user' 


      it 'does not create todo if user can not see the issue when leaving a note on a confidential issue' 


      it 'does not create a directly addressed todo if user can not see the issue when leaving a note on a confidential issue' 


      context 'on commit' do
        let(:project)  { create(:project, :repository) }

        it 'creates a todo for each valid mentioned user when leaving a note on commit' 


        it 'creates a directly addressed todo for each valid mentioned user when leaving a note on commit' 

      end

      it 'does not create todo when leaving a note on snippet' 

    end

    describe '#mark_todo' do
      it 'creates a todo from a issue' 

    end

    describe '#todo_exists?' do
      it 'returns false when no todo exist for the given issuable' 


      it 'returns true when a todo exist for the given issuable' 

    end
  end

  describe 'Merge Requests' do
    let(:mr_assigned) { create(:merge_request, source_project: project, author: author, assignee: john_doe, description: "- [ ] Task 1\n- [ ] Task 2 #{mentions}") }
    let(:addressed_mr_assigned) { create(:merge_request, source_project: project, author: author, assignee: john_doe, description: "#{directly_addressed}\n- [ ] Task 1\n- [ ] Task 2") }
    let(:mr_unassigned) { create(:merge_request, source_project: project, author: author, assignee: nil) }

    describe '#new_merge_request' do
      it 'creates a pending todo if assigned' 


      it 'does not create a todo if unassigned' 


      it 'does not create a todo if assignee is the current user' 


      it 'creates a todo for each valid mentioned user' 


      it 'creates a todo for each valid user based on the type of mention' 


      it 'creates a directly addressed todo for each valid addressed user' 

    end

    describe '#update_merge_request' do
      it 'creates a todo for each valid mentioned user not included in skip_users' 


      it 'creates a todo for each valid user not included in skip_users based on the type of mention' 


      it 'creates a directly addressed todo for each valid addressed user not included in skip_users' 


      it 'does not create a todo if user was already mentioned and todo is pending' 


      it 'does not create a todo if user was already mentioned and todo is done' 


      it 'does not create a directly addressed todo if user was already mentioned or addressed and todo is pending' 


      it 'does not create a directly addressed todo if user was already mentioned or addressed and todo is done' 


      context 'with a task list' do
        it 'does not create todo when tasks are marked as completed' 


        it 'does not create directly addressed todo when tasks are marked as completed' 


        it 'does not raise an error when description not change' 

      end
    end

    describe '#close_merge_request' do
      it 'marks related pending todos to the target for the user as done' 

    end

    describe '#reassigned_merge_request' do
      it 'creates a pending todo for new assignee' 


      it 'does not create a todo if unassigned' 


      it 'creates a todo if new assignee is the current user' 


      it 'does not create a todo for guests' 


      it 'does not create a directly addressed todo for guests' 

    end

    describe '#merge_merge_request' do
      it 'marks related pending todos to the target for the user as done' 


      it 'does not create todo for guests' 


      it 'does not create directly addressed todo for guests' 

    end

    describe '#new_award_emoji' do
      it 'marks related pending todos to the target for the user as done' 

    end

    describe '#merge_request_build_failed' do
      it 'creates a pending todo for the merge request author' 


      it 'creates a pending todo for merge_user' 

    end

    describe '#merge_request_push' do
      it 'marks related pending todos to the target for the user as done' 

    end

    describe '#merge_request_became_unmergeable' do
      it 'creates a pending todo for a merge_user' 

    end

    describe '#mark_todo' do
      it 'creates a todo from a merge request' 

    end

    describe '#new_note' do
      let(:project) { create(:project, :repository) }
      let(:mention) { john_doe.to_reference }
      let(:diff_note_on_merge_request) { create(:diff_note_on_merge_request, project: project, noteable: mr_unassigned, author: author, note: "Hey #{mention}") }
      let(:addressed_diff_note_on_merge_request) { create(:diff_note_on_merge_request, project: project, noteable: mr_unassigned, author: author, note: "#{mention}, hey!") }
      let(:legacy_diff_note_on_merge_request) { create(:legacy_diff_note_on_merge_request, project: project, noteable: mr_unassigned, author: author, note: "Hey #{mention}") }

      it 'creates a todo for mentioned user on new diff note' 


      it 'creates a directly addressed todo for addressed user on new diff note' 


      it 'creates a todo for mentioned user on legacy diff note' 


      it 'does not create todo for guests' 

    end
  end

  describe '#update_note' do
    let(:noteable) { create(:issue, project: project) }
    let(:note) { create(:note, project: project, note: mentions, noteable: noteable) }
    let(:addressed_note) { create(:note, project: project, note: "#{directly_addressed}", noteable: noteable) }

    it 'creates a todo for each valid mentioned user not included in skip_users' 


    it 'creates a todo for each valid user not included in skip_users based on the type of mention' 


    it 'creates a directly addressed todo for each valid addressed user not included in skip_users' 


    it 'does not create a todo if user was already mentioned and todo is pending' 


    it 'does not create a todo if user was already mentioned and todo is done' 


    it 'does not create a directly addressed todo if user was already mentioned or addressed and todo is pending' 


    it 'does not create a directly addressed todo if user was already mentioned or addressed and todo is done' 

  end

  it 'updates cached counts when a todo is created' 


  describe '#mark_todos_as_done' do
    let(:issue) { create(:issue, project: project, author: author, assignees: [john_doe]) }
    let(:another_issue) { create(:issue, project: project, author: author, assignees: [john_doe]) }

    it 'marks a relation of todos as done' 


    it 'marks an array of todos as done' 


    it 'returns the ids of updated todos' do # Needed on API
      todo = create(:todo, :mentioned, user: john_doe, target: issue, project: project)

      todos = TodosFinder.new(john_doe, {}).execute
      expect(described_class.new.mark_todos_as_done(todos, john_doe)).to eq([todo.id])
    end

    context 'when some of the todos are done already' do
      let!(:first_todo) { create(:todo, :mentioned, user: john_doe, target: issue, project: project) }
      let!(:second_todo) { create(:todo, :mentioned, user: john_doe, target: another_issue, project: project) }

      it 'returns the ids of those still pending' 


      it 'returns an empty array if all are done' 

    end
  end

  describe '#mark_todos_as_done_by_ids' do
    let(:issue) { create(:issue, project: project, author: author, assignees: [john_doe]) }
    let(:another_issue) { create(:issue, project: project, author: author, assignees: [john_doe]) }

    it 'marks an array of todo ids as done' 


    it 'marks a single todo id as done' 


    it 'caches the number of todos of a user', :use_clean_rails_memory_store_caching do
      create(:todo, :mentioned, user: john_doe, target: issue, project: project)
      todo = create(:todo, :mentioned, user: john_doe, target: issue, project: project)

      described_class.new.mark_todos_as_done_by_ids(todo, john_doe)

      # Make sure no TodosFinder is inialized to perform counting
      expect(TodosFinder).not_to receive(:new)

      expect(john_doe.todos_done_count).to eq(1)
      expect(john_doe.todos_pending_count).to eq(1)
    end
  end

  def should_create_todo(attributes = {})
    attributes.reverse_merge!(
      project: project,
      author: author,
      state: :pending
    )

    expect(Todo.where(attributes).count).to eq 1
  end

  def should_not_create_todo(attributes = {})
    attributes.reverse_merge!(
      project: project,
      author: author,
      state: :pending
    )

    expect(Todo.where(attributes).count).to eq 0
  end

  def should_not_create_any_todo
    expect { yield }.not_to change(Todo, :count)
  end
end

