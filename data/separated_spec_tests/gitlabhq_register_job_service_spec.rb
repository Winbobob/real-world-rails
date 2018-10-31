require 'spec_helper'

module Ci
  describe RegisterJobService do
    set(:group) { create(:group) }
    set(:project) { create(:project, group: group, shared_runners_enabled: false, group_runners_enabled: false) }
    set(:pipeline) { create(:ci_pipeline, project: project) }
    let!(:shared_runner) { create(:ci_runner, is_shared: true) }
    let!(:specific_runner) { create(:ci_runner, is_shared: false) }
    let!(:group_runner) { create(:ci_runner, groups: [group], runner_type: :group_type) }
    let!(:pending_job) { create(:ci_build, pipeline: pipeline) }

    before do
      specific_runner.assign_to(project)
    end

    describe '#execute' do
      context 'runner follow tag list' do
        it "picks build with the same tag" 


        it "does not pick build with different tag" 


        it "picks build without tag" 


        it "does not pick build with tag" 


        it "pick build without tag" 

      end

      context 'deleted projects' do
        before do
          project.update(pending_delete: true)
        end

        context 'for shared runners' do
          before do
            project.update(shared_runners_enabled: true)
          end

          it 'does not pick a build' 

        end

        context 'for specific runner' do
          it 'does not pick a build' 

        end
      end

      context 'allow shared runners' do
        before do
          project.update(shared_runners_enabled: true)
        end

        context 'for multiple builds' do
          let!(:project2) { create :project, shared_runners_enabled: true }
          let!(:pipeline2) { create :ci_pipeline, project: project2 }
          let!(:project3) { create :project, shared_runners_enabled: true }
          let!(:pipeline3) { create :ci_pipeline, project: project3 }
          let!(:build1_project1) { pending_job }
          let!(:build2_project1) { FactoryBot.create :ci_build, pipeline: pipeline }
          let!(:build3_project1) { FactoryBot.create :ci_build, pipeline: pipeline }
          let!(:build1_project2) { FactoryBot.create :ci_build, pipeline: pipeline2 }
          let!(:build2_project2) { FactoryBot.create :ci_build, pipeline: pipeline2 }
          let!(:build1_project3) { FactoryBot.create :ci_build, pipeline: pipeline3 }

          it 'prefers projects without builds first' 


          it 'equalises number of running builds' 

        end

        context 'shared runner' do
          let(:build) { execute(shared_runner) }

          it { expect(build).to be_kind_of(Build) }
          it { expect(build).to be_valid }
          it { expect(build).to be_running }
          it { expect(build.runner).to eq(shared_runner) }
        end

        context 'specific runner' do
          let(:build) { execute(specific_runner) }

          it { expect(build).to be_kind_of(Build) }
          it { expect(build).to be_valid }
          it { expect(build).to be_running }
          it { expect(build.runner).to eq(specific_runner) }
        end
      end

      context 'disallow shared runners' do
        before do
          project.update(shared_runners_enabled: false)
        end

        context 'shared runner' do
          let(:build) { execute(shared_runner) }

          it { expect(build).to be_nil }
        end

        context 'specific runner' do
          let(:build) { execute(specific_runner) }

          it { expect(build).to be_kind_of(Build) }
          it { expect(build).to be_valid }
          it { expect(build).to be_running }
          it { expect(build.runner).to eq(specific_runner) }
        end
      end

      context 'disallow when builds are disabled' do
        before do
          project.update(shared_runners_enabled: true, group_runners_enabled: true)
          project.project_feature.update_attribute(:builds_access_level, ProjectFeature::DISABLED)
        end

        context 'and uses shared runner' do
          let(:build) { execute(shared_runner) }

          it { expect(build).to be_nil }
        end

        context 'and uses group runner' do
          let(:build) { execute(group_runner) }

          it { expect(build).to be_nil }
        end

        context 'and uses project runner' do
          let(:build) { execute(specific_runner) }

          it { expect(build).to be_nil }
        end
      end

      context 'allow group runners' do
        before do
          project.update!(group_runners_enabled: true)
        end

        context 'for multiple builds' do
          let!(:project2) { create :project, group_runners_enabled: true, group: group }
          let!(:pipeline2) { create :ci_pipeline, project: project2 }
          let!(:project3) { create :project, group_runners_enabled: true, group: group }
          let!(:pipeline3) { create :ci_pipeline, project: project3 }

          let!(:build1_project1) { pending_job }
          let!(:build2_project1) { create :ci_build, pipeline: pipeline }
          let!(:build3_project1) { create :ci_build, pipeline: pipeline }
          let!(:build1_project2) { create :ci_build, pipeline: pipeline2 }
          let!(:build2_project2) { create :ci_build, pipeline: pipeline2 }
          let!(:build1_project3) { create :ci_build, pipeline: pipeline3 }

          # these shouldn't influence the scheduling
          let!(:unrelated_group) { create :group }
          let!(:unrelated_project) { create :project, group_runners_enabled: true, group: unrelated_group }
          let!(:unrelated_pipeline) { create :ci_pipeline, project: unrelated_project }
          let!(:build1_unrelated_project) { create :ci_build, pipeline: unrelated_pipeline }
          let!(:unrelated_group_runner) { create :ci_runner, groups: [unrelated_group] }

          it 'does not consider builds from other group runners' 

        end

        context 'group runner' do
          let(:build) { execute(group_runner) }

          it { expect(build).to be_kind_of(Build) }
          it { expect(build).to be_valid }
          it { expect(build).to be_running }
          it { expect(build.runner).to eq(group_runner) }
        end
      end

      context 'disallow group runners' do
        before do
          project.update!(group_runners_enabled: false)
        end

        context 'group runner' do
          let(:build) { execute(group_runner) }

          it { expect(build).to be_nil }
        end
      end

      context 'when first build is stalled' do
        before do
          pending_job.update(lock_version: 0)
        end

        subject { described_class.new(specific_runner).execute }

        context 'with multiple builds are in queue' do
          let!(:other_build) { create :ci_build, pipeline: pipeline }

          before do
            allow_any_instance_of(Ci::RegisterJobService).to receive(:builds_for_project_runner)
              .and_return(Ci::Build.where(id: [pending_job, other_build]))
          end

          it "receives second build from the queue" 

        end

        context 'when single build is in queue' do
          before do
            allow_any_instance_of(Ci::RegisterJobService).to receive(:builds_for_project_runner)
              .and_return(Ci::Build.where(id: pending_job))
          end

          it "does not receive any valid result" 

        end

        context 'when there is no build in queue' do
          before do
            allow_any_instance_of(Ci::RegisterJobService).to receive(:builds_for_project_runner)
              .and_return(Ci::Build.none)
          end

          it "does not receive builds but result is valid" 

        end
      end

      context 'when access_level of runner is not_protected' do
        let!(:specific_runner) { create(:ci_runner, :specific) }

        context 'when a job is protected' do
          let!(:pending_job) { create(:ci_build, :protected, pipeline: pipeline) }

          it 'picks the job' 

        end

        context 'when a job is unprotected' do
          let!(:pending_job) { create(:ci_build, pipeline: pipeline) }

          it 'picks the job' 

        end

        context 'when protected attribute of a job is nil' do
          let!(:pending_job) { create(:ci_build, pipeline: pipeline) }

          before do
            pending_job.update_attribute(:protected, nil)
          end

          it 'picks the job' 

        end
      end

      context 'when access_level of runner is ref_protected' do
        let!(:specific_runner) { create(:ci_runner, :ref_protected, :specific) }

        context 'when a job is protected' do
          let!(:pending_job) { create(:ci_build, :protected, pipeline: pipeline) }

          it 'picks the job' 

        end

        context 'when a job is unprotected' do
          let!(:pending_job) { create(:ci_build, pipeline: pipeline) }

          it 'does not pick the job' 

        end

        context 'when protected attribute of a job is nil' do
          let!(:pending_job) { create(:ci_build, pipeline: pipeline) }

          before do
            pending_job.update_attribute(:protected, nil)
          end

          it 'does not pick the job' 

        end
      end

      context 'when "dependencies" keyword is specified' do
        shared_examples 'not pick' do
          it 'does not pick the build and drops the build' 

        end

        shared_examples 'validation is active' do
          context 'when depended job has not been completed yet' do
            let!(:pre_stage_job) { create(:ci_build, :manual, pipeline: pipeline, name: 'test', stage_idx: 0) }

            it { expect(subject).to eq(pending_job) }
          end

          context 'when artifacts of depended job has been expired' do
            let!(:pre_stage_job) { create(:ci_build, :success, :expired, pipeline: pipeline, name: 'test', stage_idx: 0) }

            it_behaves_like 'not pick'
          end

          context 'when artifacts of depended job has been erased' do
            let!(:pre_stage_job) { create(:ci_build, :success, pipeline: pipeline, name: 'test', stage_idx: 0, erased_at: 1.minute.ago) }

            before do
              pre_stage_job.erase
            end

            it_behaves_like 'not pick'
          end

          context 'when job object is staled' do
            let!(:pre_stage_job) { create(:ci_build, :success, :expired, pipeline: pipeline, name: 'test', stage_idx: 0) }

            before do
              allow_any_instance_of(Ci::Build).to receive(:drop!)
                .and_raise(ActiveRecord::StaleObjectError.new(pending_job, :drop!))
            end

            it 'does not drop nor pick' 

          end
        end

        shared_examples 'validation is not active' do
          context 'when depended job has not been completed yet' do
            let!(:pre_stage_job) { create(:ci_build, :manual, pipeline: pipeline, name: 'test', stage_idx: 0) }

            it { expect(subject).to eq(pending_job) }
          end
          context 'when artifacts of depended job has been expired' do
            let!(:pre_stage_job) { create(:ci_build, :success, :expired, pipeline: pipeline, name: 'test', stage_idx: 0) }

            it { expect(subject).to eq(pending_job) }
          end

          context 'when artifacts of depended job has been erased' do
            let!(:pre_stage_job) { create(:ci_build, :success, pipeline: pipeline, name: 'test', stage_idx: 0, erased_at: 1.minute.ago) }

            before do
              pre_stage_job.erase
            end

            it { expect(subject).to eq(pending_job) }
          end
        end

        before do
          stub_feature_flags(ci_disable_validates_dependencies: false)
        end

        let!(:pre_stage_job) { create(:ci_build, :success, pipeline: pipeline, name: 'test', stage_idx: 0) }
        let!(:pending_job) { create(:ci_build, :pending, pipeline: pipeline, stage_idx: 1, options: { dependencies: ['test'] } ) }

        subject { execute(specific_runner) }

        context 'when validates for dependencies is enabled' do
          before do
            stub_feature_flags(ci_disable_validates_dependencies: false)
          end

          it_behaves_like 'validation is active'
        end

        context 'when validates for dependencies is disabled' do
          before do
            stub_feature_flags(ci_disable_validates_dependencies: true)
          end

          it_behaves_like 'validation is not active'
        end
      end
    end

    describe '#register_success' do
      let!(:current_time) { Time.new(2018, 4, 5, 14, 0, 0) }
      let!(:attempt_counter) { double('Gitlab::Metrics::NullMetric') }
      let!(:job_queue_duration_seconds) { double('Gitlab::Metrics::NullMetric') }

      before do
        allow(Time).to receive(:now).and_return(current_time)

        # Stub defaults for any metrics other than the ones we're testing
        allow(Gitlab::Metrics).to receive(:counter)
                                    .with(any_args)
                                    .and_return(Gitlab::Metrics::NullMetric.instance)
        allow(Gitlab::Metrics).to receive(:histogram)
                                    .with(any_args)
                                    .and_return(Gitlab::Metrics::NullMetric.instance)

        # Stub tested metrics
        allow(Gitlab::Metrics).to receive(:counter)
                                    .with(:job_register_attempts_total, anything)
                                    .and_return(attempt_counter)
        allow(Gitlab::Metrics).to receive(:histogram)
                                    .with(:job_queue_duration_seconds, anything, anything, anything)
                                    .and_return(job_queue_duration_seconds)

        project.update(shared_runners_enabled: true)
        pending_job.update(created_at: current_time - 3600, queued_at: current_time - 1800)
      end

      shared_examples 'attempt counter collector' do
        it 'increments attempt counter' 

      end

      shared_examples 'jobs queueing time histogram collector' do
        it 'counts job queuing time histogram with expected labels' 


        context 'when project already has running jobs' do
          let!(:build2) { create( :ci_build, :running, pipeline: pipeline, runner: shared_runner) }
          let!(:build3) { create( :ci_build, :running, pipeline: pipeline, runner: shared_runner) }

          it 'counts job queuing time histogram with expected labels' 

        end
      end

      shared_examples 'metrics collector' do
        it_behaves_like 'attempt counter collector'
        it_behaves_like 'jobs queueing time histogram collector'
      end

      context 'when shared runner is used' do
        let(:runner) { shared_runner }
        let(:expected_shared_runner) { true }
        let(:expected_jobs_running_for_project_first_job) { 0 }
        let(:expected_jobs_running_for_project_third_job) { 2 }

        it_behaves_like 'metrics collector'

        context 'when pending job with queued_at=nil is used' do
          before do
            pending_job.update(queued_at: nil)
          end

          it_behaves_like 'attempt counter collector'

          it "doesn't count job queuing time histogram" 

        end
      end

      context 'when specific runner is used' do
        let(:runner) { specific_runner }
        let(:expected_shared_runner) { false }
        let(:expected_jobs_running_for_project_first_job) { '+Inf' }
        let(:expected_jobs_running_for_project_third_job) { '+Inf' }

        it_behaves_like 'metrics collector'
      end
    end

    def execute(runner)
      described_class.new(runner).execute.build
    end
  end
end

