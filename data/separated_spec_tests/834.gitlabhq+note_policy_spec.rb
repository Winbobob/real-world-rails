require 'spec_helper'

describe NotePolicy, mdoels: true do
  describe '#rules' do
    let(:user) { create(:user) }
    let(:project) { create(:project, :public) }
    let(:issue) { create(:issue, project: project) }

    def policies(noteable = nil)
      return @policies if @policies

      noteable ||= issue
      note = create(:note, noteable: noteable, author: user, project: project)

      @policies = described_class.new(user, note)
    end

    context 'when the project is public' do
      context 'when the note author is not a project member' do
        it 'can edit a note' 

      end

      context 'when the noteable is a snippet' do
        it 'can edit note' 

      end

      context 'when a discussion is locked' do
        before do
          issue.update_attribute(:discussion_locked, true)
        end

        context 'when the note author is a project member' do
          before do
            project.add_developer(user)
          end

          it 'can edit a note' 

        end

        context 'when the note author is not a project member' do
          it 'can not edit a note' 


          it 'can read a note' 

        end
      end
    end
  end
end

