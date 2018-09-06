require 'spec_helper'

describe MergeRequests::AddTodoWhenBuildFailsService do
  let(:user) { create(:user) }
  let(:merge_request) { create(:merge_request) }
  let(:project) { create(:project, :repository) }
  let(:sha) { '1234567890abcdef1234567890abcdef12345678' }
  let(:ref) { merge_request.source_branch }

  let(:pipeline) do
    create(:ci_pipeline_with_one_job, ref: ref,
                                      project: project,
                                      sha: sha)
  end

  let(:service) do
    described_class.new(project, user, commit_message: 'Awesome message')
  end

  let(:todo_service) { spy('todo service') }

  let(:merge_request) do
    create(:merge_request, merge_user: user,
                           source_branch: 'master',
                           target_branch: 'feature',
                           source_project: project,
                           target_project: project,
                           state: 'opened')
  end

  before do
    allow_any_instance_of(MergeRequest)
      .to receive(:head_pipeline)
      .and_return(pipeline)

    allow(service).to receive(:todo_service).and_return(todo_service)
  end

  describe '#execute' do
    context 'commit status with ref' do
      let(:commit_status) do
        create(:generic_commit_status, ref: ref, pipeline: pipeline)
      end

      it 'notifies the todo service' 

    end

    context 'commit status with non-HEAD ref' do
      let(:commit_status) { create(:generic_commit_status, ref: ref) }

      it 'does not notify the todo service' 

    end

    context 'commit status without ref' do
      let(:commit_status) { create(:generic_commit_status) }

      it 'does not notify the todo service' 

    end

    context 'when commit status is a build allowed to fail' do
      let(:commit_status) do
        create(:ci_build, :allowed_to_fail, ref: ref, pipeline: pipeline)
      end

      it 'does not create todo' 

    end
  end

  describe '#close' do
    context 'commit status with ref' do
      let(:commit_status) { create(:generic_commit_status, ref: merge_request.source_branch, pipeline: pipeline) }

      it 'notifies the todo service' 

    end

    context 'commit status with non-HEAD ref' do
      let(:commit_status) { create(:generic_commit_status, ref: merge_request.source_branch) }

      it 'does not notify the todo service' 

    end

    context 'commit status without ref' do
      let(:commit_status) { create(:generic_commit_status) }

      it 'does not notify the todo service' 

    end
  end

  describe '#close_all' do
    context 'when using pipeline that belongs to merge request' do
      it 'resolves todos about failed builds for pipeline' 

    end

    context 'when pipeline is not related to merge request' do
      let(:pipeline) { create(:ci_empty_pipeline) }

      it 'does not resolve any todos about failed builds' 

    end
  end
end

