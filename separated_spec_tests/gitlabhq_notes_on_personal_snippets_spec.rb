require 'spec_helper'

describe 'Comments on personal snippets', :js do
  include NoteInteractionHelpers

  let!(:user)    { create(:user) }
  let!(:snippet) { create(:personal_snippet, :public) }
  let!(:snippet_notes) do
    [
      create(:note_on_personal_snippet, noteable: snippet, author: user),
      create(:note_on_personal_snippet, noteable: snippet)
    ]
  end
  let!(:other_note) { create(:note_on_personal_snippet) }

  before do
    sign_in user
    visit snippet_path(snippet)
  end

  subject { page }

  context 'when viewing the snippet detail page' do
    it 'contains notes for a snippet with correct action icons' 

  end

  context 'when submitting a note' do
    it 'shows a valid form' 


    it 'previews a note' 


    it 'creates a note' 


    it 'should not have autocomplete' 

  end

  context 'when editing a note' do
    it 'changes the text' 

  end

  context 'when deleting a note' do
    it 'removes the note from the snippet detail page' 

  end
end

