require 'rails_helper'

describe 'Merge request > User sees merge widget', :js do
  include ProjectForksHelper

  let(:project) { create(:project, :repository) }
  let(:project_only_mwps) { create(:project, :repository, only_allow_merge_if_pipeline_succeeds: true) }
  let(:user) { project.creator }
  let(:merge_request) { create(:merge_request, source_project: project) }
  let(:merge_request_in_only_mwps_project) { create(:merge_request, source_project: project_only_mwps) }

  before do
    project.add_master(user)
    project_only_mwps.add_master(user)
    sign_in(user)
  end

  context 'new merge request' do
    before do
      visit project_new_merge_request_path(
        project,
        merge_request: {
          source_project_id: project.id,
          target_project_id: project.id,
          source_branch: 'feature',
          target_branch: 'master'
        })
    end

    it 'shows widget status after creating new merge request' 

  end

  context 'view merge request' do
    let!(:environment) { create(:environment, project: project) }

    let!(:deployment) do
      create(:deployment, environment: environment,
                          ref: 'feature',
                          sha: merge_request.diff_head_sha)
    end

    before do
      visit project_merge_request_path(project, merge_request)
    end

    it 'shows environments link' 


    it 'shows green accept merge request button' 


    it 'allows me to merge, see cherry-pick modal and load branches list' 

  end

  context 'view merge request with external CI service' do
    before do
      create(:service, project: project,
                       active: true,
                       type: 'CiService',
                       category: 'ci')

      visit project_merge_request_path(project, merge_request)
    end

    it 'has danger button while waiting for external CI status' 

  end

  context 'view merge request with failed GitLab CI pipelines' do
    before do
      commit_status = create(:commit_status, project: project, status: 'failed')
      pipeline = create(:ci_pipeline, project: project,
                                      sha: merge_request.diff_head_sha,
                                      ref: merge_request.source_branch,
                                      status: 'failed',
                                      statuses: [commit_status],
                                      head_pipeline_of: merge_request)
      create(:ci_build, :pending, pipeline: pipeline)

      visit project_merge_request_path(project, merge_request)
    end

    it 'has danger button when not succeeded' 

  end

  context 'when merge request is in the blocked pipeline state' do
    before do
      create(
        :ci_pipeline,
        project: project,
        sha: merge_request.diff_head_sha,
        ref: merge_request.source_branch,
        status: :manual,
        head_pipeline_of: merge_request)

      visit project_merge_request_path(project, merge_request)
    end

    it 'shows information about blocked pipeline' 

  end

  context 'view merge request with MWBS button' do
    before do
      commit_status = create(:commit_status, project: project, status: 'pending')
      pipeline = create(:ci_pipeline, project: project,
                                      sha: merge_request.diff_head_sha,
                                      ref: merge_request.source_branch,
                                      status: 'pending',
                                      statuses: [commit_status],
                                      head_pipeline_of: merge_request)
      create(:ci_build, :pending, pipeline: pipeline)

      visit project_merge_request_path(project, merge_request)
    end

    it 'has info button when MWBS button' 

  end

  context 'view merge request where project has CI setup but no CI status' do
    before do
      pipeline = create(:ci_pipeline, project: project,
                                      sha: merge_request.diff_head_sha,
                                      ref: merge_request.source_branch)
      create(:ci_build, pipeline: pipeline)

      visit project_merge_request_path(project, merge_request)
    end

    it 'has pipeline error text' 

  end

  context 'view merge request in project with only-mwps setting enabled but no CI is setup' do
    before do
      visit project_merge_request_path(project_only_mwps, merge_request_in_only_mwps_project)
    end

    it 'should be allowed to merge' 

  end

  context 'view merge request with MWPS enabled but automatically merge fails' do
    before do
      merge_request.update(
        merge_when_pipeline_succeeds: true,
        merge_user: merge_request.author,
        merge_error: 'Something went wrong'
      )

      visit project_merge_request_path(project, merge_request)
    end

    it 'shows information about the merge error' 

  end

  context 'view merge request with MWPS enabled but automatically merge fails' do
    before do
      merge_request.update(
        merge_when_pipeline_succeeds: true,
        merge_user: merge_request.author,
        merge_error: 'Something went wrong'
      )

      visit project_merge_request_path(project, merge_request)
    end

    it 'shows information about the merge error' 

  end

  context 'view merge request where fast-forward merge is not possible' do
    before do
      project.update(merge_requests_ff_only_enabled: true)

      merge_request.update(
        merge_user: merge_request.author,
        merge_status: :cannot_be_merged
      )

      visit project_merge_request_path(project, merge_request)
    end

    it 'shows information about the merge error' 

  end

  context 'merge error' do
    before do
      allow_any_instance_of(Repository).to receive(:merge).and_return(false)
      visit project_merge_request_path(project, merge_request)
    end

    it 'updates the MR widget' 

  end

  context 'user can merge into source project but cannot push to fork', :js do
    let(:fork_project) { create(:project, :public, :repository) }
    let(:user2) { create(:user) }

    before do
      project.add_master(user2)
      sign_out(:user)
      sign_in(user2)
      merge_request.update(target_project: fork_project)
      visit project_merge_request_path(project, merge_request)
    end

    it 'user can merge into the source project' 


    it 'user cannot remove source branch' 

  end

  context 'user cannot merge project and cannot push to fork', :js do
    let(:forked_project) { fork_project(project, nil, repository: true) }
    let(:user2) { create(:user) }

    before do
      project.add_developer(user2)
      sign_out(:user)
      sign_in(user2)
      merge_request.update(
        source_project: forked_project,
        target_project: project,
        merge_params: { 'force_remove_source_branch' => '1' }
      )
      visit project_merge_request_path(project, merge_request)
    end

    it 'user cannot remove source branch' 

  end

  context 'ongoing merge process' do
    it 'shows Merging state' 

  end
end

