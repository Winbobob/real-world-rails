require 'spec_helper.rb'

describe Issues::BuildService do
  let(:project) { create(:project, :repository) }
  let(:user) { create(:user) }

  before do
    project.add_developer(user)
  end

  context 'for a single discussion' do
    describe '#execute' do
      let(:merge_request) { create(:merge_request, title: "Hello world", source_project: project) }
      let(:discussion) { create(:diff_note_on_merge_request, project: project, noteable: merge_request, note: "Almost done").to_discussion }
      let(:service) { described_class.new(project, user, merge_request_to_resolve_discussions_of: merge_request.iid, discussion_to_resolve: discussion.id) }

      it 'references the noteable title in the issue title' 


      it 'adds the note content to the description' 

    end
  end

  context 'for discussions in a merge request' do
    let(:merge_request) { create(:merge_request_with_diff_notes, source_project: project) }
    let(:issue) { described_class.new(project, user, merge_request_to_resolve_discussions_of: merge_request.iid).execute }

    describe '#items_for_discussions' do
      it 'has an item for each discussion' 

    end

    describe '#item_for_discussion' do
      let(:service) { described_class.new(project, user, merge_request_to_resolve_discussions_of: merge_request.iid) }

      it 'mentions the author of the note' 


      it 'wraps the note in a blockquote' 

    end

    describe '#execute' do
      it 'has the merge request reference in the title' 


      it 'has the reference of the merge request in the description' 


      it 'does not assign title when a title was given' 


      it 'does not assign description when a description was given' 


      describe 'with multiple discussions' do
        let!(:diff_note) { create(:diff_note_on_merge_request, noteable: merge_request, project: merge_request.target_project, line_number: 15) }

        it 'mentions all the authors in the description' 


        it 'has a link for each unresolved discussion in the description' 


        it 'mentions additional notes' 

      end
    end
  end

  context 'For a merge request without discussions' do
    let(:merge_request) { create(:merge_request, source_project: project) }

    describe '#execute' do
      it 'mentions the merge request in the description' 

    end
  end

  describe '#execute' do
    let(:milestone) { create(:milestone, project: project) }

    it 'builds a new issues with given params' 

  end
end

