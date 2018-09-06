require 'rails_helper'

describe 'Merge request > User sees diff', :js do
  include ProjectForksHelper

  let(:project) { create(:project, :public, :repository) }
  let(:merge_request) { create(:merge_request, source_project: project) }

  context 'when visit with */* as accept header' do
    it 'renders the notes' 

  end

  context 'when linking to note' do
    describe 'with unresolved note' do
      let(:note) { create :diff_note_on_merge_request, project: project, noteable: merge_request }
      let(:fragment) { "#note_#{note.id}" }

      before do
        visit "#{diffs_project_merge_request_path(project, merge_request)}#{fragment}"
      end

      it 'shows expanded note' 

    end

    describe 'with resolved note' do
      let(:note) { create :diff_note_on_merge_request, :resolved, project: project, noteable: merge_request }
      let(:fragment) { "#note_#{note.id}" }

      before do
        visit "#{diffs_project_merge_request_path(project, merge_request)}#{fragment}"
      end

      it 'shows expanded note' 

    end
  end

  context 'when merge request has overflow' do
    it 'displays warning' 

  end

  context 'when editing file' do
    let(:author_user) { create(:user) }
    let(:user) { create(:user) }
    let(:forked_project) { fork_project(project, author_user, repository: true) }
    let(:merge_request) { create(:merge_request_with_diffs, source_project: forked_project, target_project: project, author: author_user) }
    let(:changelog_id) { Digest::SHA1.hexdigest("CHANGELOG") }

    before do
      forked_project.repository.after_import
    end

    context 'as author' do
      it 'shows direct edit link' 

    end

    context 'as user who needs to fork' do
      it 'shows fork/cancel confirmation' 

    end
  end
end

