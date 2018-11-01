require 'spec_helper'

describe Ci::ProcessPipelineService, '#execute' do
  let(:user) { create(:user) }
  let(:project) { create(:project) }

  let(:pipeline) do
    create(:ci_empty_pipeline, ref: 'master', project: project)
  end

  before do
    stub_ci_pipeline_to_return_yaml_file

    stub_not_protect_default_branch

    project.add_developer(user)
  end

  context 'when simple pipeline is defined' do
    before do
      create_build('linux', stage_idx: 0)
      create_build('mac', stage_idx: 0)
      create_build('rspec', stage_idx: 1)
      create_build('rubocop', stage_idx: 1)
      create_build('deploy', stage_idx: 2)
    end

    it 'processes a pipeline' 


    it 'does not process pipeline if existing stage is running' 

  end

  context 'custom stage with first job allowed to fail' do
    before do
      create_build('clean_job', stage_idx: 0, allow_failure: true)
      create_build('test_job', stage_idx: 1, allow_failure: true)
    end

    it 'automatically triggers a next stage when build finishes' 

  end

  context 'when optional manual actions are defined' do
    before do
      create_build('build', stage_idx: 0)
      create_build('test', stage_idx: 1)
      create_build('test_failure', stage_idx: 2, when: 'on_failure')
      create_build('deploy', stage_idx: 3)
      create_build('production', stage_idx: 3, when: 'manual', allow_failure: true)
      create_build('cleanup', stage_idx: 4, when: 'always')
      create_build('clear:cache', stage_idx: 4, when: 'manual', allow_failure: true)
    end

    context 'when builds are successful' do
      it 'properly processes the pipeline' 

    end

    context 'when test job fails' do
      it 'properly processes the pipeline' 

    end

    context 'when test and test_failure jobs fail' do
      it 'properly processes the pipeline' 

    end

    context 'when deploy job fails' do
      it 'properly processes the pipeline' 

    end

    context 'when build is canceled in the second stage' do
      it 'does not schedule builds after build has been canceled' 

    end

    context 'when listing optional manual actions' do
      it 'returns only for skipped builds' 

    end
  end

  context 'when delayed jobs are defined' do
    context 'when the scene is timed incremental rollout' do
      before do
        create_build('build', stage_idx: 0)
        create_build('rollout10%', **delayed_options, stage_idx: 1)
        create_build('rollout100%', **delayed_options, stage_idx: 2)
        create_build('cleanup', stage_idx: 3)

        allow(Ci::BuildScheduleWorker).to receive(:perform_at)
      end

      context 'when builds are successful' do
        it 'properly processes the pipeline' 

      end

      context 'when build job fails' do
        it 'properly processes the pipeline' 

      end

      context 'when rollout 10% is unscheduled' do
        it 'properly processes the pipeline' 


        context 'when user plays rollout 10%' do
          it 'schedules rollout100%' 

        end
      end

      context 'when rollout 10% fails' do
        it 'properly processes the pipeline' 


        context 'when user retries rollout 10%' do
          it 'does not schedule rollout10% again' 

        end
      end

      context 'when rollout 10% is played immidiately' do
        it 'properly processes the pipeline' 

      end
    end

    context 'when only one scheduled job exists in a pipeline' do
      before do
        create_build('delayed', **delayed_options, stage_idx: 0)

        allow(Ci::BuildScheduleWorker).to receive(:perform_at)
      end

      it 'properly processes the pipeline' 

    end

    context 'when there are two delayed jobs in a stage' do
      before do
        create_build('delayed1', **delayed_options, stage_idx: 0)
        create_build('delayed2', **delayed_options, stage_idx: 0)
        create_build('job', stage_idx: 1)

        allow(Ci::BuildScheduleWorker).to receive(:perform_at)
      end

      it 'blocks the stage until all scheduled jobs finished' 

    end

    context 'when a delayed job is allowed to fail' do
      before do
        create_build('delayed', **delayed_options, allow_failure: true, stage_idx: 0)
        create_build('job', stage_idx: 1)

        allow(Ci::BuildScheduleWorker).to receive(:perform_at)
      end

      it 'blocks the stage and continues after it failed' 

    end
  end

  context 'when there are manual action in earlier stages' do
    context 'when first stage has only optional manual actions' do
      before do
        create_build('build', stage_idx: 0, when: 'manual', allow_failure: true)
        create_build('check', stage_idx: 1)
        create_build('test', stage_idx: 2)

        process_pipeline
      end

      it 'starts from the second stage' 

    end

    context 'when second stage has only optional manual actions' do
      before do
        create_build('check', stage_idx: 0)
        create_build('build', stage_idx: 1, when: 'manual', allow_failure: true)
        create_build('test', stage_idx: 2)

        process_pipeline
      end

      it 'skips second stage and continues on third stage' 

    end
  end

  context 'when there are only manual actions in stages' do
    before do
      create_build('image', stage_idx: 0, when: 'manual', allow_failure: true)
      create_build('build', stage_idx: 1, when: 'manual', allow_failure: true)
      create_build('deploy', stage_idx: 2, when: 'manual')
      create_build('check', stage_idx: 3)

      process_pipeline
    end

    it 'processes all jobs until blocking actions encountered' 

  end

  context 'when there is only one manual action' do
    before do
      create_build('deploy', stage_idx: 0, when: 'manual', allow_failure: true)

      process_pipeline
    end

    it 'skips the pipeline' 


    context 'when the action was played' do
      before do
        play_manual_action('deploy')
      end

      it 'queues the action and pipeline' 

    end
  end

  context 'when blocking manual actions are defined' do
    before do
      create_build('code:test', stage_idx: 0)
      create_build('staging:deploy', stage_idx: 1, when: 'manual')
      create_build('staging:test', stage_idx: 2, when: 'on_success')
      create_build('production:deploy', stage_idx: 3, when: 'manual')
      create_build('production:test', stage_idx: 4, when: 'always')
    end

    context 'when first stage succeeds' do
      it 'blocks pipeline on stage with first manual action' 

    end

    context 'when first stage fails' do
      it 'does not take blocking action into account' 

    end

    context 'when pipeline is promoted sequentially up to the end' do
      before do
        # Users need ability to merge into a branch in order to trigger
        # protected manual actions.
        #
        create(:protected_branch, :developers_can_merge,
               name: 'master', project: project)
      end

      it 'properly processes entire pipeline' 

    end
  end

  context 'when second stage has only on_failure jobs' do
    before do
      create_build('check', stage_idx: 0)
      create_build('build', stage_idx: 1, when: 'on_failure')
      create_build('test', stage_idx: 2)

      process_pipeline
    end

    it 'skips second stage and continues on third stage' 

  end

  context 'when failed build in the middle stage is retried' do
    context 'when failed build is the only unsuccessful build in the stage' do
      before do
        create_build('build:1', stage_idx: 0)
        create_build('build:2', stage_idx: 0)
        create_build('test:1', stage_idx: 1)
        create_build('test:2', stage_idx: 1)
        create_build('deploy:1', stage_idx: 2)
        create_build('deploy:2', stage_idx: 2)
      end

      it 'does trigger builds in the next stage' 

    end
  end

  context 'updates a list of retried builds' do
    subject { described_class.retried.order(:id) }

    let!(:build_retried) { create_build('build') }
    let!(:build) { create_build('build') }
    let!(:test) { create_build('test') }

    it 'returns unique statuses' 

  end

  context 'when builds with auto-retries are configured' do
    before do
      create_build('build:1', stage_idx: 0, user: user, options: { retry: 2 })
      create_build('test:1', stage_idx: 1, user: user, when: :on_failure)
      create_build('test:2', stage_idx: 1, user: user, options: { retry: 1 })
    end

    it 'automatically retries builds in a valid order' 

  end

  def process_pipeline
    described_class.new(pipeline.project, user).execute(pipeline)
  end

  def all_builds
    pipeline.builds.order(:stage_idx, :id)
  end

  def builds
    all_builds.where.not(status: [:created, :skipped])
  end

  def builds_names
    builds.pluck(:name)
  end

  def builds_names_and_statuses
    builds.each_with_object({}) do |b, h|
      h[b.name.to_sym] = b.status
      h
    end
  end

  def all_builds_names
    all_builds.pluck(:name)
  end

  def builds_statuses
    builds.pluck(:status)
  end

  def all_builds_statuses
    all_builds.pluck(:status)
  end

  def succeed_pending
    builds.pending.map(&:success)
  end

  def succeed_running_or_pending
    pipeline.builds.running_or_pending.each(&:success)
  end

  def fail_running_or_pending
    pipeline.builds.running_or_pending.each(&:drop)
  end

  def cancel_running_or_pending
    pipeline.builds.running_or_pending.each(&:cancel)
  end

  def play_manual_action(name)
    builds.find_by(name: name).play(user)
  end

  def enqueue_scheduled(name)
    builds.scheduled.find_by(name: name).enqueue
  end

  def retry_build(name)
    Ci::Build.retry(builds.find_by(name: name), user)
  end

  def manual_actions
    pipeline.manual_actions(true)
  end

  def create_build(name, **opts)
    create(:ci_build, :created, pipeline: pipeline, name: name, **opts)
  end

  def delayed_options
    { when: 'delayed', options: { start_in: '1 minute' } }
  end

  def unschedule
    pipeline.builds.scheduled.map(&:unschedule)
  end
end

