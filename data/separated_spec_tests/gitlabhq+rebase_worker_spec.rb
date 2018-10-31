require 'spec_helper'

describe RebaseWorker, '#perform' do
  include ProjectForksHelper

  context 'when rebasing an MR from a fork where upstream has protected branches' do
    let(:upstream_project) { create(:project, :repository) }
    let(:forked_project) { fork_project(upstream_project, nil, repository: true) }

    let(:merge_request) do
      create(:merge_request,
             source_project: forked_project,
             source_branch: 'feature_conflict',
             target_project: upstream_project,
             target_branch: 'master')
    end

    it 'sets the correct project for running hooks' 

  end
end

