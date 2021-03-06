require 'spec_helper'
require Rails.root.join('db', 'migrate', '20180201110056_add_foreign_keys_to_todos.rb')

describe AddForeignKeysToTodos, :migration do
  let(:todos) { table(:todos) }

  let(:project) { create(:project) } # rubocop:disable RSpec/FactoriesInMigrationSpecs
  let(:user) { create(:user) } # rubocop:disable RSpec/FactoriesInMigrationSpecs

  context 'add foreign key on user_id' do
    let!(:todo_with_user) { create_todo(user_id: user.id) }
    let!(:todo_without_user) { create_todo(user_id: 4711) }

    it 'removes orphaned todos without corresponding user' 


    it 'does not remove entries with valid user_id' 

  end

  context 'add foreign key on author_id' do
    let!(:todo_with_author) { create_todo(author_id: user.id) }
    let!(:todo_with_invalid_author) { create_todo(author_id: 4711) }

    it 'removes orphaned todos by author_id' 


    it 'does not touch author_id for valid entries' 

  end

  context 'add foreign key on note_id' do
    let(:note) { create(:note) } # rubocop:disable RSpec/FactoriesInMigrationSpecs
    let!(:todo_with_note) { create_todo(note_id: note.id) }
    let!(:todo_with_invalid_note) { create_todo(note_id: 4711) }
    let!(:todo_without_note) { create_todo(note_id: nil) }

    it 'deletes todo if note_id is set but does not exist in notes table' 


    it 'does not touch entry if note_id is nil' 


    it 'does not touch note_id for valid entries' 

  end

  def create_todo(**opts)
    todos.create!(
      project_id: project.id,
      user_id: user.id,
      author_id: user.id,
      target_type: '',
      action: 0,
      state: '', **opts
    )
  end
end

