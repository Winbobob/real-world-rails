require 'spec_helper'

feature 'Issue notes polling', :js do
  include NoteInteractionHelpers

  let(:project) { create(:project, :public) }
  let(:issue) { create(:issue, project: project) }

  describe 'creates' do
    before do
      visit project_issue_path(project, issue)
    end

    it 'displays the new comment' 

  end

  describe 'updates' do
    context 'when from own user' do
      let(:user) { create(:user) }
      let(:note_text) { "Hello World" }
      let(:updated_text) { "Bye World" }
      let!(:existing_note) { create(:note, noteable: issue, project: project, author: user, note: note_text) }

      before do
        sign_in(user)
        visit project_issue_path(project, issue)
      end

      it 'displays the updated content' 


      it 'when editing but have not changed anything, and an update comes in, show warning and does not update the note' 


      it 'when editing but you changed some things, an update comes in, and you press cancel, show the updated content' 

    end

    context 'when from another user' do
      let(:user1) { create(:user) }
      let(:user2) { create(:user) }
      let(:note_text) { "Hello World" }
      let(:updated_text) { "Bye World" }
      let!(:existing_note) { create(:note, noteable: issue, project: project, author: user1, note: note_text) }

      before do
        sign_in(user2)
        visit project_issue_path(project, issue)
      end

      it 'displays the updated content' 

    end

    context 'system notes' do
      let(:user) { create(:user) }
      let(:note_text) { "Some system note" }
      let!(:system_note) { create(:system_note, noteable: issue, project: project, author: user, note: note_text) }

      before do
        sign_in(user)
        visit project_issue_path(project, issue)
      end

      it 'shows the system note' 

    end
  end

  def update_note(note, new_text)
    note.update(note: new_text)
    wait_for_requests
  end

  def click_edit_action(note)
    note_element = find("#note_#{note.id}")

    note_element.find('.js-note-edit').click
  end
end

