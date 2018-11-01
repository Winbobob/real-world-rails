require 'spec_helper'

describe Notes::BuildService do
  let(:note) { create(:discussion_note_on_issue) }
  let(:project) { note.project }
  let(:author) { note.author }
  let(:merge_request) { create(:merge_request, source_project: project) }
  let(:mr_note) { create(:discussion_note_on_merge_request, noteable: merge_request, project: project, author: author) }

  describe '#execute' do
    context 'when in_reply_to_discussion_id is specified' do
      context 'when a note with that original discussion ID exists' do
        it 'sets the note up to be in reply to that note' 


        context 'when discussion is resolved' do
          before do
            mr_note.resolve!(author)
          end

          it 'resolves the note' 

        end
      end

      context 'when a note with that discussion ID exists' do
        it 'sets the note up to be in reply to that note' 

      end

      context 'when no note with that discussion ID exists' do
        it 'sets an error' 

      end

      context 'personal snippet note' do
        def reply(note, user = nil)
          user ||= create(:user)

          described_class.new(nil,
                              user,
                              note: 'Test',
                              in_reply_to_discussion_id: note.discussion_id).execute
        end

        let(:snippet_author) { create(:user) }

        context 'when a snippet is public' do
          it 'creates a reply note' 

        end

        context 'when a snippet is private' do
          let(:snippet) { create(:personal_snippet, :private, author: snippet_author) }
          let(:note) { create(:discussion_note_on_personal_snippet, noteable: snippet) }

          it 'creates a reply note when the author replies' 


          it 'sets an error when another user replies' 

        end

        context 'when a snippet is internal' do
          let(:snippet) { create(:personal_snippet, :internal, author: snippet_author) }
          let(:note) { create(:discussion_note_on_personal_snippet, noteable: snippet) }

          it 'creates a reply note when the author replies' 


          it 'creates a reply note when a regular user replies' 


          it 'sets an error when an external user replies' 

        end
      end
    end

    it 'builds a note without saving it' 

  end
end

