require 'spec_helper'

describe Notes::QuickActionsService do
  shared_context 'note on noteable' do
    let(:project) { create(:project) }
    let(:master) { create(:user).tap { |u| project.add_master(u) } }
    let(:assignee) { create(:user) }

    before do
      project.add_master(assignee)
    end
  end

  shared_examples 'note on noteable that does not support quick actions' do
    include_context 'note on noteable'

    before do
      note.note = note_text
    end

    describe 'note with only command' do
      describe '/close, /label, /assign & /milestone' do
        let(:note_text) { %(/close\n/assign @#{assignee.username}") }

        it 'saves the note and does not alter the note text' 

      end
    end

    describe 'note with command & text' do
      describe '/close, /label, /assign & /milestone' do
        let(:note_text) { %(HELLO\n/close\n/assign @#{assignee.username}\nWORLD) }

        it 'saves the note and does not alter the note text' 

      end
    end
  end

  shared_examples 'note on noteable that supports quick actions' do
    include_context 'note on noteable'

    before do
      note.note = note_text
    end

    let!(:milestone) { create(:milestone, project: project) }
    let!(:labels) { create_pair(:label, project: project) }

    describe 'note with only command' do
      describe '/close, /label, /assign & /milestone' do
        let(:note_text) do
          %(/close\n/label ~#{labels.first.name} ~#{labels.last.name}\n/assign @#{assignee.username}\n/milestone %"#{milestone.name}")
        end

        it 'closes noteable, sets labels, assigns, and sets milestone to noteable, and leave no note' 

      end

      describe '/reopen' do
        before do
          note.noteable.close!
          expect(note.noteable).to be_closed
        end
        let(:note_text) { '/reopen' }

        it 'opens the noteable, and leave no note' 

      end

      describe '/spend' do
        let(:note_text) { '/spend 1h' }

        it 'updates the spent time on the noteable' 

      end
    end

    describe 'note with command & text' do
      describe '/close, /label, /assign & /milestone' do
        let(:note_text) do
          %(HELLO\n/close\n/label ~#{labels.first.name} ~#{labels.last.name}\n/assign @#{assignee.username}\n/milestone %"#{milestone.name}"\nWORLD)
        end

        it 'closes noteable, sets labels, assigns, and sets milestone to noteable' 

      end

      describe '/reopen' do
        before do
          note.noteable.close
          expect(note.noteable).to be_closed
        end
        let(:note_text) { "HELLO\n/reopen\nWORLD" }

        it 'opens the noteable' 

      end
    end
  end

  describe '.noteable_update_service' do
    include_context 'note on noteable'

    it 'returns Issues::UpdateService for a note on an issue' 


    it 'returns Issues::UpdateService for a note on a merge request' 


    it 'returns nil for a note on a commit' 

  end

  describe '.supported?' do
    include_context 'note on noteable'

    let(:note) { create(:note_on_issue, project: project) }

    context 'with a note on an issue' do
      it 'returns true' 

    end

    context 'with a note on a commit' do
      let(:note) { create(:note_on_commit, project: project) }

      it 'returns false' 

    end
  end

  describe '#supported?' do
    include_context 'note on noteable'

    it 'delegates to the class method' 

  end

  describe '#execute' do
    let(:service) { described_class.new(project, master) }

    it_behaves_like 'note on noteable that supports quick actions' do
      let(:note) { build(:note_on_issue, project: project) }
    end

    it_behaves_like 'note on noteable that supports quick actions' do
      let(:note) { build(:note_on_merge_request, project: project) }
    end

    it_behaves_like 'note on noteable that does not support quick actions' do
      let(:note) { build(:note_on_commit, project: project) }
    end
  end

  context 'CE restriction for issue assignees' do
    describe '/assign' do
      let(:project) { create(:project) }
      let(:master) { create(:user).tap { |u| project.add_master(u) } }
      let(:assignee) { create(:user) }
      let(:master) { create(:user) }
      let(:service) { described_class.new(project, master) }
      let(:note) { create(:note_on_issue, note: note_text, project: project) }

      let(:note_text) do
        %(/assign @#{assignee.username} @#{master.username}\n")
      end

      before do
        project.add_master(master)
        project.add_master(assignee)
      end

      it 'adds only one assignee from the list' 

    end
  end
end

