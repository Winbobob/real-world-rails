require "spec_helper"

describe NotesHelper do
  include RepoHelpers

  let(:owner) { create(:owner) }
  let(:group) { create(:group) }
  let(:project) { create(:project, namespace: group) }
  let(:master) { create(:user) }
  let(:reporter) { create(:user) }
  let(:guest) { create(:user) }

  let(:owner_note) { create(:note, author: owner, project: project) }
  let(:master_note) { create(:note, author: master, project: project) }
  let(:reporter_note) { create(:note, author: reporter, project: project) }
  let!(:notes) { [owner_note, master_note, reporter_note] }

  before do
    group.add_owner(owner)
    project.add_master(master)
    project.add_reporter(reporter)
    project.add_guest(guest)
  end

  describe "#notes_max_access_for_users" do
    it 'returns access levels' 


    it 'handles access in different projects' 

  end

  describe '#discussion_path' do
    let(:project) { create(:project, :repository) }
    let(:anchor) { discussion.line_code }

    context 'for a merge request discusion' do
      let(:merge_request) { create(:merge_request, source_project: project, target_project: project, importing: true) }
      let!(:merge_request_diff1) { merge_request.merge_request_diffs.create(head_commit_sha: '6f6d7e7ed97bb5f0054f2b1df789b39ca89b6ff9') }
      let!(:merge_request_diff2) { merge_request.merge_request_diffs.create(head_commit_sha: nil) }
      let!(:merge_request_diff3) { merge_request.merge_request_diffs.create(head_commit_sha: '5937ac0a7beb003549fc5fd26fc247adbce4a52e') }

      context 'for a diff discussion' do
        context 'when the discussion is active' do
          let(:discussion) { create(:diff_note_on_merge_request, noteable: merge_request, project: project).to_discussion }

          it 'returns the diff path with the line code' 

        end

        context 'when the discussion is on an older merge request version' do
          let(:position) do
            Gitlab::Diff::Position.new(
              old_path: ".gitmodules",
              new_path: ".gitmodules",
              old_line: nil,
              new_line: 4,
              diff_refs: merge_request_diff1.diff_refs
            )
          end

          let(:diff_note) { create(:diff_note_on_merge_request, noteable: merge_request, project: project, position: position) }
          let(:discussion) { diff_note.to_discussion }

          before do
            diff_note.position = diff_note.original_position
            diff_note.save!
          end

          it 'returns the diff version path with the line code' 

        end

        context 'when the discussion is on a comparison between merge request versions' do
          let(:position) do
            Gitlab::Diff::Position.new(
              old_path: ".gitmodules",
              new_path: ".gitmodules",
              old_line: 4,
              new_line: 4,
              diff_refs: merge_request_diff3.compare_with(merge_request_diff1.head_commit_sha).diff_refs
            )
          end

          let(:diff_note) { create(:diff_note_on_merge_request, noteable: merge_request, project: project, position: position) }
          let(:discussion) { diff_note.to_discussion }

          before do
            diff_note.position = diff_note.original_position
            diff_note.save!
          end

          it 'returns the diff version comparison path with the line code' 

        end

        context 'when the discussion does not have a merge request version' do
          let(:outdated_diff_note) { create(:diff_note_on_merge_request, noteable: merge_request, project: project, diff_refs: project.commit(sample_commit.id).diff_refs) }
          let(:discussion) { outdated_diff_note.to_discussion }

          before do
            outdated_diff_note.position = outdated_diff_note.original_position
            outdated_diff_note.save!
          end

          it 'returns nil' 

        end
      end

      context 'for a legacy diff discussion' do
        let(:discussion) { create(:legacy_diff_note_on_merge_request, noteable: merge_request, project: project).to_discussion }

        context 'when the discussion is active' do
          before do
            allow(discussion).to receive(:active?).and_return(true)
          end

          it 'returns the diff path with the line code' 

        end

        context 'when the discussion is outdated' do
          before do
            allow(discussion).to receive(:active?).and_return(false)
          end

          it 'returns nil' 

        end
      end

      context 'for a non-diff discussion' do
        let(:discussion) { create(:discussion_note_on_merge_request, noteable: merge_request, project: project).to_discussion }

        it 'returns nil' 

      end

      context 'for a contextual commit discussion' do
        let(:commit) { merge_request.commits.last }
        let(:discussion) { create(:diff_note_on_merge_request, noteable: merge_request, project: project, commit_id: commit.id).to_discussion }

        it 'returns the merge request diff discussion scoped in the commit' 

      end
    end

    context 'for a commit discussion' do
      let(:commit) { discussion.noteable }

      context 'for a diff discussion' do
        let(:discussion) { create(:diff_note_on_commit, project: project).to_discussion }

        it 'returns the commit path with the line code' 

      end

      context 'for a legacy diff discussion' do
        let(:discussion) { create(:legacy_diff_note_on_commit, project: project).to_discussion }

        it 'returns the commit path with the line code' 

      end

      context 'for a non-diff discussion' do
        let(:discussion) { create(:discussion_note_on_commit, project: project).to_discussion }

        it 'returns the commit path' 

      end
    end
  end

  describe '#notes_url' do
    it 'return snippet notes path for personal snippet' 


    it 'return project notes path for project snippet' 


    it 'return project notes path for other noteables' 

  end

  describe '#note_url' do
    it 'return snippet notes path for personal snippet' 


    it 'return project notes path for project snippet' 


    it 'return project notes path for other noteables' 

  end

  describe '#form_resources' do
    it 'returns note for personal snippet' 


    it 'returns namespace, project and note for project snippet' 


    it 'returns namespace, project and note path for other noteables' 

  end

  describe '#noteable_note_url' do
    let(:project) { create(:project) }
    let(:issue) { create(:issue, project: project) }
    let(:note) { create(:note_on_issue, noteable: issue, project: project) }

    it 'returns the noteable url with an anchor to the note' 

  end

  describe '#discussion_resolved_intro' do
    context 'when the discussion was resolved by a push' do
      let(:discussion) { double(:discussion, resolved_by_push?: true) }

      it 'returns "Automatically resolved"' 

    end

    context 'when the discussion was not resolved by a push' do
      let(:discussion) { double(:discussion, resolved_by_push?: false) }

      it 'returns "Resolved"' 

    end
  end
end

