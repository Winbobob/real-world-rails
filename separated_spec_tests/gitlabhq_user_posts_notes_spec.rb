require 'rails_helper'

describe 'Merge request > User posts notes', :js do
  include NoteInteractionHelpers

  let(:project) { create(:project, :repository) }
  let(:user) { project.creator }
  let(:merge_request) do
    create(:merge_request, source_project: project, target_project: project)
  end
  let!(:note) do
    create(:note_on_merge_request, :with_attachment, noteable: merge_request,
                                                     project: project)
  end

  before do
    project.add_master(user)
    sign_in(user)
    visit project_merge_request_path(project, merge_request)
  end

  subject { page }

  describe 'the note form' do
    it 'is valid' 


    describe 'with text' do
      before do
        page.within('.js-main-target-form') do
          fill_in 'note[note]', with: 'This is awesome'
        end
      end

      it 'has enable submit button and preview button' 

    end
  end

  describe 'when posting a note' do
    before do
      page.within('.js-main-target-form') do
        fill_in 'note[note]', with: 'This is awesome!'
        find('.js-md-preview-button').click
        click_button 'Comment'
      end
    end

    it 'is added and form reset' 

  end

  describe 'when previewing a note' do
    it 'shows the toolbar buttons when editing a note' 


    it 'hides the toolbar buttons when previewing a note' 

  end

  describe 'when editing a note' do
    it 'there should be a hidden edit form' 


    describe 'editing the note' do
      before do
        find('.note').hover

        find('.js-note-edit').click
      end

      it 'shows the note edit form and hide the note body' 


      it 'resets the edit note form textarea with the original content of the note if cancelled' 


      it 'allows using markdown buttons after saving a note and then trying to edit it again' 


      it 'appends the edited at time to the note' 

    end

    describe 'deleting attachment on legacy diff note' do
      before do
        find('.note').hover

        find('.js-note-edit').click
      end

      it 'shows the delete link' 


      it 'removes the attachment div and resets the edit form' 

    end
  end
end

