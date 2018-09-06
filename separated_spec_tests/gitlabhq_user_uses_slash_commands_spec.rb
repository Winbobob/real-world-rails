require 'rails_helper'

describe 'Merge request > User uses quick actions', :js do
  include Spec::Support::Helpers::Features::NotesHelpers

  let(:project) { create(:project, :public, :repository) }
  let(:user) { project.creator }
  let(:guest) { create(:user) }
  let(:merge_request) { create(:merge_request, source_project: project) }
  let!(:milestone) { create(:milestone, project: project, title: 'ASAP') }

  it_behaves_like 'issuable record that supports quick actions in its description and notes', :merge_request do
    let(:issuable) { create(:merge_request, source_project: project) }
    let(:new_url_opts) { { merge_request: { source_branch: 'feature', target_branch: 'master' } } }
  end

  describe 'merge-request-only commands' do
    let(:user) { create(:user) }
    let(:project) { create(:project, :public, :repository) }
    let(:merge_request) { create(:merge_request, source_project: project) }
    let!(:milestone) { create(:milestone, project: project, title: 'ASAP') }

    before do
      project.add_master(user)
      sign_in(user)
      visit project_merge_request_path(project, merge_request)
    end

    describe 'time tracking' do
      it_behaves_like 'issuable time tracker'
    end

    describe 'toggling the WIP prefix in the title from note' do
      context 'when the current user can toggle the WIP prefix' do
        it 'adds the WIP: prefix to the title' 


        it 'removes the WIP: prefix from the title' 

      end

      context 'when the current user cannot toggle the WIP prefix' do
        before do
          project.add_guest(guest)
          sign_out(:user)
          sign_in(guest)
          visit project_merge_request_path(project, merge_request)
        end

        it 'does not change the WIP prefix' 

      end
    end

    describe 'merging the MR from the note' do
      context 'when the current user can merge the MR' do
        it 'merges the MR' 

      end

      context 'when the head diff changes in the meanwhile' do
        before do
          merge_request.source_branch = 'another_branch'
          merge_request.save
        end

        it 'does not merge the MR' 

      end

      context 'when the current user cannot merge the MR' do
        before do
          project.add_guest(guest)
          sign_out(:user)
          sign_in(guest)
          visit project_merge_request_path(project, merge_request)
        end

        it 'does not merge the MR' 

      end
    end

    describe 'adding a due date from note' do
      it 'does not recognize the command nor create a note' 

    end

    describe '/target_branch command in merge request' do
      let(:another_project) { create(:project, :public, :repository) }
      let(:new_url_opts) { { merge_request: { source_branch: 'feature' } } }

      before do
        sign_out(:user)
        another_project.add_master(user)
        sign_in(user)
      end

      it 'changes target_branch in new merge_request' 


      it 'does not change target branch when merge request is edited' 

    end

    describe '/target_branch command from note' do
      context 'when the current user can change target branch' do
        it 'changes target branch from a note' 


        it 'does not fail when target branch does not exists' 

      end

      context 'when current user can not change target branch' do
        before do
          project.add_guest(guest)
          sign_out(:user)
          sign_in(guest)
          visit project_merge_request_path(project, merge_request)
        end

        it 'does not change target branch' 

      end
    end
  end
end

