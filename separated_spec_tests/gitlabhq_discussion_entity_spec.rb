require 'spec_helper'

describe DiscussionEntity do
  include RepoHelpers

  let(:user) { create(:user) }
  let(:note) { create(:discussion_note_on_merge_request) }
  let(:discussion) { note.discussion }
  let(:request) { double('request', note_entity: ProjectNoteEntity) }
  let(:controller) { double('controller') }
  let(:entity) { described_class.new(discussion, request: request, context: controller) }

  subject { entity.as_json }

  before do
    allow(controller).to receive(:render_to_string)
    allow(request).to receive(:current_user).and_return(user)
    allow(request).to receive(:noteable).and_return(note.noteable)
  end

  it 'exposes correct attributes' 


  context 'when diff file is present' do
    let(:note) { create(:diff_note_on_merge_request) }

    it 'exposes diff file attributes' 

  end
end
