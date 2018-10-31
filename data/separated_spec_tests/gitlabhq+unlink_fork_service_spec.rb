require 'spec_helper'

describe Projects::UnlinkForkService do
  include ProjectForksHelper

  subject { described_class.new(forked_project, user) }

  let(:project) { create(:project, :public) }
  let(:forked_project) { fork_project(project, user) }
  let(:user) { create(:user) }

  context 'with opened merge request on the source project' do
    let(:merge_request) { create(:merge_request, source_project: forked_project, target_project: forked_project.forked_from_project) }
    let(:merge_request2) { create(:merge_request, source_project: forked_project, target_project: fork_project(project)) }
    let(:merge_request_in_fork) { create(:merge_request, source_project: forked_project, target_project: forked_project) }

    let(:mr_close_service) { MergeRequests::CloseService.new(forked_project, user) }

    before do
      allow(MergeRequests::CloseService).to receive(:new)
        .with(forked_project, user)
        .and_return(mr_close_service)
    end

    it 'close all pending merge requests' 


    it 'does not close merge requests for the project being unlinked' 

  end

  it 'removes the link to the fork network' 


  it 'refreshes the forks count cache of the source project' 


  context 'when the source has LFS objects' do
    let(:lfs_object) { create(:lfs_object) }

    before do
      lfs_object.projects << project
    end

    it 'links the fork to the lfs object before unlinking' 


    it 'does not fail if the lfs objects were already linked' 

  end

  context 'when the original project was deleted' do
    it 'does not fail when the original project is deleted' 

  end
end

