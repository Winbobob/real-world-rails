require 'rails_helper'

describe 'Merge request > User scrolls to note on load', :js do
  let(:project) { create(:project, :public, :repository) }
  let(:user) { project.creator }
  let(:merge_request) { create(:merge_request, source_project: project, author: user) }
  let(:note) { create(:diff_note_on_merge_request, noteable: merge_request, project: project) }
  let(:resolved_note) { create(:diff_note_on_merge_request, :resolved, noteable: merge_request, project: project) }
  let(:fragment_id) { "#note_#{note.id}" }
  let(:collapsed_fragment_id) { "#note_#{resolved_note.id}" }

  before do
    sign_in(user)
    page.current_window.resize_to(1000, 300)
  end

  it 'scrolls note into view' 


  it 'renders un-collapsed notes with diff' 


  it 'expands collapsed notes' 

end

