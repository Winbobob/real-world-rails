require 'spec_helper'

describe Ci::RetryPipelineService, '#execute' do
  include ProjectForksHelper

  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:pipeline) { create(:ci_pipeline, project: project) }
  let(:service) { described_class.new(project, user) }

  context 'when user has full ability to modify pipeline' do
    before do
      project.add_developer(user)

      create(:protected_branch, :developers_can_merge,
             name: pipeline.ref, project: project)
    end

    context 'when there are already retried jobs present' do
      before do
        create_build('rspec', :canceled, 0, retried: true)
        create_build('rspec', :failed, 0)
      end

      it 'does not retry jobs that has already been retried' 

    end

    context 'when there are failed builds in the last stage' do
      before do
        create_build('rspec 1', :success, 0)
        create_build('rspec 2', :failed, 1)
        create_build('rspec 3', :canceled, 1)
      end

      it 'enqueues all builds in the last stage' 

    end

    context 'when there are failed or canceled builds in the first stage' do
      before do
        create_build('rspec 1', :failed, 0)
        create_build('rspec 2', :canceled, 0)
        create_build('rspec 3', :canceled, 1)
        create_build('spinach 1', :canceled, 2)
      end

      it 'retries builds failed builds and marks subsequent for processing' 

    end

    context 'when there is failed build present which was run on failure' do
      before do
        create_build('rspec 1', :failed, 0)
        create_build('rspec 2', :canceled, 0)
        create_build('rspec 3', :canceled, 1)
        create_build('report 1', :failed, 2)
      end

      it 'retries builds only in the first stage' 


      it 'creates a new job for report job in this case' 

    end

    context 'when the last stage was skipepd' do
      before do
        create_build('build 1', :success, 0)
        create_build('test 2', :failed, 1)
        create_build('report 3', :skipped, 2)
        create_build('report 4', :skipped, 2)
      end

      it 'retries builds only in the first stage' 

    end

    context 'when pipeline contains manual actions' do
      context 'when there are optional manual actions only' do
        context 'when there is a canceled manual action in first stage' do
          before do
            create_build('rspec 1', :failed, 0)
            create_build('staging', :canceled, 0, when: :manual, allow_failure: true)
            create_build('rspec 2', :canceled, 1)
          end

          it 'retries failed builds and marks subsequent for processing' 

        end
      end

      context 'when pipeline has blocking manual actions defined' do
        context 'when pipeline retry should enqueue builds' do
          before do
            create_build('test', :failed, 0)
            create_build('deploy', :canceled, 0, when: :manual, allow_failure: false)
            create_build('verify', :canceled, 1)
          end

          it 'retries failed builds' 

        end

        context 'when pipeline retry should block pipeline immediately' do
          before do
            create_build('test', :success, 0)
            create_build('deploy:1', :success, 1, when: :manual, allow_failure: false)
            create_build('deploy:2', :failed, 1, when: :manual, allow_failure: false)
            create_build('verify', :canceled, 2)
          end

          it 'reprocesses blocking manual action and blocks pipeline' 

        end
      end

      context 'when there is a skipped manual action in last stage' do
        before do
          create_build('rspec 1', :canceled, 0)
          create_build('rspec 2', :skipped, 0, when: :manual, allow_failure: true)
          create_build('staging', :skipped, 1, when: :manual, allow_failure: true)
        end

        it 'retries canceled job and reprocesses manual actions' 

      end

      context 'when there is a created manual action in the last stage' do
        before do
          create_build('rspec 1', :canceled, 0)
          create_build('staging', :created, 1, when: :manual, allow_failure: true)
        end

        it 'retries canceled job and does not update the manual action' 

      end

      context 'when there is a created manual action in the first stage' do
        before do
          create_build('rspec 1', :canceled, 0)
          create_build('staging', :created, 0, when: :manual, allow_failure: true)
        end

        it 'retries canceled job and processes the manual action' 

      end
    end

    it 'closes all todos about failed jobs for pipeline' 


    it 'reprocesses the pipeline' 

  end

  context 'when user is not allowed to retry pipeline' do
    it 'raises an error' 

  end

  context 'when user is not allowed to trigger manual action' do
    before do
      project.add_developer(user)
      create(:protected_branch, :maintainers_can_push,
             name: pipeline.ref, project: project)
    end

    context 'when there is a failed manual action present' do
      before do
        create_build('test', :failed, 0)
        create_build('deploy', :failed, 0, when: :manual)
        create_build('verify', :canceled, 1)
      end

      it 'raises an error' 

    end

    context 'when there is a failed manual action in later stage' do
      before do
        create_build('test', :failed, 0)
        create_build('deploy', :failed, 1, when: :manual)
        create_build('verify', :canceled, 2)
      end

      it 'raises an error' 

    end
  end

  context 'when maintainer is allowed to push to forked project' do
    let(:user) { create(:user) }
    let(:project) { create(:project, :public) }
    let(:forked_project) { fork_project(project) }
    let(:pipeline) { create(:ci_pipeline, project: forked_project, ref: 'fixes') }

    before do
      project.add_maintainer(user)
      create(:merge_request,
        source_project: forked_project,
        target_project: project,
        source_branch: 'fixes',
        allow_collaboration: true)
      create_build('rspec 1', :failed, 1)
    end

    it 'allows to retry failed pipeline' 

  end

  def statuses
    pipeline.reload.statuses
  end

  def build(name)
    statuses.latest.find_by(name: name)
  end

  def create_build(name, status, stage_num, **opts)
    create(:ci_build, name: name,
                      status: status,
                      stage: "stage_#{stage_num}",
                      stage_idx: stage_num,
                      pipeline: pipeline, **opts) do |build|
      pipeline.update_status
    end
  end
end

