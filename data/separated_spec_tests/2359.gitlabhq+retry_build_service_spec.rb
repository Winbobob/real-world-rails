require 'spec_helper'

describe Ci::RetryBuildService do
  set(:user) { create(:user) }
  set(:project) { create(:project) }
  set(:pipeline) { create(:ci_pipeline, project: project) }

  let(:stage) do
    create(:ci_stage_entity, project: project,
                             pipeline: pipeline,
                             name: 'test')
  end

  let(:build) { create(:ci_build, pipeline: pipeline, stage_id: stage.id) }

  let(:service) do
    described_class.new(project, user)
  end

  CLONE_ACCESSORS = described_class::CLONE_ACCESSORS

  REJECT_ACCESSORS =
    %i[id status user token coverage trace runner artifacts_expire_at
       artifacts_file artifacts_metadata artifacts_size created_at
       updated_at started_at finished_at queued_at erased_by
       erased_at auto_canceled_by job_artifacts job_artifacts_archive
       job_artifacts_metadata job_artifacts_trace job_artifacts_junit
       job_artifacts_sast job_artifacts_dependency_scanning
       job_artifacts_container_scanning job_artifacts_dast
       job_artifacts_license_management job_artifacts_performance
       job_artifacts_codequality scheduled_at].freeze

  IGNORE_ACCESSORS =
    %i[type lock_version target_url base_tags trace_sections
       commit_id deployments erased_by_id last_deployment project_id
       runner_id tag_taggings taggings tags trigger_request_id
       user_id auto_canceled_by_id retried failure_reason
       artifacts_file_store artifacts_metadata_store
       metadata runner_session trace_chunks].freeze

  shared_examples 'build duplication' do
    let(:another_pipeline) { create(:ci_empty_pipeline, project: project) }

    let(:build) do
      create(:ci_build, :failed, :expired, :erased, :queued, :coverage, :tags,
             :allowed_to_fail, :on_tag, :triggered, :teardown_environment,
             description: 'my-job', stage: 'test', stage_id: stage.id,
             pipeline: pipeline, auto_canceled_by: another_pipeline,
             scheduled_at: 10.seconds.since)
    end

    before do
      # Make sure that build has both `stage_id` and `stage` because FactoryBot
      # can reset one of the fields when assigning another. We plan to deprecate
      # and remove legacy `stage` column in the future.
      build.update(stage: 'test', stage_id: stage.id)

      # Make sure we have one instance for every possible job_artifact_X
      # associations to check they are correctly rejected on build duplication.
      Ci::JobArtifact::TYPE_AND_FORMAT_PAIRS.each do |file_type, file_format|
        create(:ci_job_artifact, file_format,
               file_type: file_type, job: build, expire_at: build.artifacts_expire_at)
      end

      build.reload
    end

    describe 'clone accessors' do
      CLONE_ACCESSORS.each do |attribute|
        it "clones #{attribute} build attribute" 

      end

      context 'when job has nullified protected' do
        before do
          build.update_attribute(:protected, nil)
        end

        it "clones protected build attribute" 

      end
    end

    describe 'reject acessors' do
      REJECT_ACCESSORS.each do |attribute|
        it "does not clone #{attribute} build attribute" 

      end
    end

    it 'has correct number of known attributes' 

  end

  describe '#execute' do
    let(:new_build) do
      Timecop.freeze(1.second.from_now) do
        service.execute(build)
      end
    end

    context 'when user has ability to execute build' do
      before do
        stub_not_protect_default_branch

        project.add_developer(user)
      end

      it_behaves_like 'build duplication'

      it 'creates a new build that represents the old one' 


      it 'enqueues the new build' 


      it 'resolves todos for old build that failed' 


      context 'when there are subsequent builds that are skipped' do
        let!(:subsequent_build) do
          create(:ci_build, :skipped, stage_idx: 2,
                                      pipeline: pipeline,
                                      stage: 'deploy')
        end

        it 'resumes pipeline processing in a subsequent stage' 

      end
    end

    context 'when user does not have ability to execute build' do
      it 'raises an error' 

    end
  end

  describe '#reprocess' do
    let(:new_build) do
      Timecop.freeze(1.second.from_now) do
        service.reprocess!(build)
      end
    end

    context 'when user has ability to execute build' do
      before do
        stub_not_protect_default_branch

        project.add_developer(user)
      end

      it_behaves_like 'build duplication'

      it 'creates a new build that represents the old one' 


      it 'does not enqueue the new build' 


      it 'does mark old build as retried in the database and on the instance' 

    end

    context 'when user does not have ability to execute build' do
      it 'raises an error' 

    end
  end
end

