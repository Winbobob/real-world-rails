require 'rails_helper'

describe 'Merge request > User sees avatars on diff notes', :js do
  include NoteInteractionHelpers

  let(:project)       { create(:project, :public, :repository) }
  let(:user)          { project.creator }
  let(:merge_request) { create(:merge_request_with_diffs, source_project: project, author: user, title: "Bug NS-04") }
  let(:path)          { "files/ruby/popen.rb" }
  let(:position) do
    Gitlab::Diff::Position.new(
      old_path: path,
      new_path: path,
      old_line: nil,
      new_line: 9,
      diff_refs: merge_request.diff_refs
    )
  end
  let!(:note) { create(:diff_note_on_merge_request, project: project, noteable: merge_request, position: position) }

  before do
    project.add_master(user)
    sign_in user

    set_cookie('sidebar_collapsed', 'true')
  end

  context 'discussion tab' do
    before do
      visit project_merge_request_path(project, merge_request)
    end

    it 'does not show avatars on discussion tab' 


    it 'does not render avatars after commening on discussion tab' 

  end

  context 'commit view' do
    before do
      visit project_commit_path(project, merge_request.commits.first.id)
    end

    it 'does not render avatar after commenting' 

  end

  %w(inline parallel).each do |view|
    context "#{view} view" do
      before do
        visit diffs_project_merge_request_path(project, merge_request, view: view)

        wait_for_requests
      end

      it 'shows note avatar' 


      it 'shows comment on note avatar' 


      it 'toggles comments when clicking avatar' 


      it 'removes avatar when note is deleted' 


      it 'adds avatar when commenting' 


      it 'adds multiple comments' 


      context 'multiple comments' do
        before do
          create_list(:diff_note_on_merge_request, 3, project: project, noteable: merge_request, in_reply_to: note)
          visit diffs_project_merge_request_path(project, merge_request, view: view)

          wait_for_requests
        end

        it 'shows extra comment count' 

      end
    end
  end

  def find_line(line_code)
    line = find("[id='#{line_code}']")
    line = line.find(:xpath, 'preceding-sibling::*[1][self::td]') if line.tag_name == 'td'
    line
  end
end

