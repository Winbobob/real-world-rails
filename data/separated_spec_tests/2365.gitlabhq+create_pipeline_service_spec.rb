require 'spec_helper'

describe Ci::CreatePipelineService do
  include ProjectForksHelper

  set(:project) { create(:project, :repository) }
  let(:user) { create(:admin) }
  let(:ref_name) { 'refs/heads/master' }

  before do
    stub_repository_ci_yaml_file(sha: anything)
  end

  describe '#execute' do
    def execute_service(
      source: :push,
      after: project.commit.id,
      message: 'Message',
      ref: ref_name,
      trigger_request: nil,
      variables_attributes: nil)
      params = { ref: ref,
                 before: '00000000',
                 after: after,
                 commits: [{ message: message }],
                 variables_attributes: variables_attributes }

      described_class.new(project, user, params).execute(
        source, trigger_request: trigger_request)
    end

    context 'valid params' do
      let(:pipeline) { execute_service }

      let(:pipeline_on_previous_commit) do
        execute_service(
          after: previous_commit_sha_from_ref('master')
        )
      end

      it 'creates a pipeline' 


      it 'increments the prometheus counter' 


      context 'when merge requests already exist for this source branch' do
        let(:merge_request_1) do
          create(:merge_request, source_branch: 'master', target_branch: "branch_1", source_project: project)
        end
        let(:merge_request_2) do
          create(:merge_request, source_branch: 'master', target_branch: "branch_2", source_project: project)
        end

        context 'when related merge request is already merged' do
          let!(:merged_merge_request) do
            create(:merge_request, source_branch: 'master', target_branch: "branch_2", source_project: project, state: 'merged')
          end

          it 'does not schedule update head pipeline job' 

        end

        context 'when the head pipeline sha equals merge request sha' do
          it 'updates head pipeline of each merge request' 

        end

        context 'when the head pipeline sha does not equal merge request sha' do
          it 'does not update the head piepeline of MRs' 

        end

        context 'when there is no pipeline for source branch' do
          it "does not update merge request head pipeline" 

        end

        context 'when merge request target project is different from source project' do
          let!(:project) { fork_project(target_project, nil, repository: true) }
          let!(:target_project) { create(:project, :repository) }

          it 'updates head pipeline for merge request' 

        end

        context 'when the pipeline is not the latest for the branch' do
          it 'does not update merge request head pipeline' 

        end

        context 'when pipeline has errors' do
          before do
            stub_ci_pipeline_yaml_file('some invalid syntax')
          end

          it 'updates merge request head pipeline reference' 

        end

        context 'when pipeline has been skipped' do
          before do
            allow_any_instance_of(Ci::Pipeline)
              .to receive(:git_commit_message)
              .and_return('some commit [ci skip]')
          end

          it 'updates merge request head pipeline' 

        end
      end

      context 'auto-cancel enabled' do
        before do
          project.update(auto_cancel_pending_pipelines: 'enabled')
        end

        it 'does not cancel HEAD pipeline' 


        it 'auto cancel pending non-HEAD pipelines' 


        it 'does not cancel running outdated pipelines' 


        it 'cancel created outdated pipelines' 


        it 'does not cancel pipelines from the other branches' 

      end

      context 'auto-cancel disabled' do
        before do
          project.update(auto_cancel_pending_pipelines: 'disabled')
        end

        it 'does not auto cancel pending non-HEAD pipelines' 

      end

      def previous_commit_sha_from_ref(ref)
        project.commit(ref).parent.sha
      end
    end

    context "skip tag if there is no build for it" do
      it "creates commit if there is appropriate job" 


      it "creates commit if there is no appropriate job but deploy job has right ref setting" 

    end

    it 'skips creating pipeline for refs without .gitlab-ci.yml' 


    shared_examples 'a failed pipeline' do
      it 'creates failed pipeline' 

    end

    context 'when yaml is invalid' do
      let(:ci_yaml) { 'invalid: file: fiile' }
      let(:message) { 'Message' }

      it_behaves_like 'a failed pipeline'

      context 'when receive git commit' do
        before do
          allow_any_instance_of(Ci::Pipeline).to receive(:git_commit_message) { message }
        end

        it_behaves_like 'a failed pipeline'
      end
    end

    context 'when commit contains a [ci skip] directive' do
      let(:message) { "some message[ci skip]" }

      ci_messages = [
        "some message[ci skip]",
        "some message[skip ci]",
        "some message[CI SKIP]",
        "some message[SKIP CI]",
        "some message[ci_skip]",
        "some message[skip_ci]",
        "some message[ci-skip]",
        "some message[skip-ci]"
      ]

      before do
        allow_any_instance_of(Ci::Pipeline).to receive(:git_commit_message) { message }
      end

      ci_messages.each do |ci_message|
        it "skips builds creation if the commit message is #{ci_message}" 

      end

      shared_examples 'creating a pipeline' do
        it 'does not skip pipeline creation' 

      end

      context 'when commit message does not contain [ci skip] nor [skip ci]' do
        let(:commit_message) { 'some message' }

        it_behaves_like 'creating a pipeline'
      end

      context 'when commit message is nil' do
        let(:commit_message) { nil }

        it_behaves_like 'creating a pipeline'
      end

      context 'when there is [ci skip] tag in commit message and yaml is invalid' do
        let(:ci_yaml) { 'invalid: file: fiile' }

        it_behaves_like 'a failed pipeline'
      end
    end

    context 'when there are no jobs for this pipeline' do
      before do
        config = YAML.dump({ test: { script: 'ls', only: ['feature'] } })
        stub_ci_pipeline_yaml_file(config)
      end

      it 'does not create a new pipeline' 

    end

    context 'with manual actions' do
      before do
        config = YAML.dump({ deploy: { script: 'ls', when: 'manual' } })
        stub_ci_pipeline_yaml_file(config)
      end

      it 'does not create a new pipeline' 

    end

    context 'with environment' do
      before do
        config = YAML.dump(deploy: { environment: { name: "review/$CI_COMMIT_REF_NAME" }, script: 'ls' })
        stub_ci_pipeline_yaml_file(config)
      end

      it 'creates the environment' 

    end

    context 'with environment name including persisted variables' do
      before do
        config = YAML.dump(
          deploy: {
            environment: { name: "review/id1$CI_PIPELINE_ID/id2$CI_BUILD_ID" },
            script: 'ls'
          }
        )

        stub_ci_pipeline_yaml_file(config)
      end

      it 'skipps persisted variables in environment name' 

    end

    context 'when environment with invalid name' do
      before do
        config = YAML.dump(deploy: { environment: { name: 'name,with,commas' }, script: 'ls' })
        stub_ci_pipeline_yaml_file(config)
      end

      it 'does not create an environment' 

    end

    context 'when builds with auto-retries are configured' do
      before do
        config = YAML.dump(rspec: { script: 'rspec', retry: 2 })
        stub_ci_pipeline_yaml_file(config)
      end

      it 'correctly creates builds with auto-retry value configured' 

    end

    shared_examples 'when ref is protected' do
      let(:user) { create(:user) }

      context 'when user is developer' do
        before do
          project.add_developer(user)
        end

        it 'does not create a pipeline' 

      end

      context 'when user is maintainer' do
        let(:pipeline) { execute_service }

        before do
          project.add_maintainer(user)
        end

        it 'creates a protected pipeline' 

      end

      context 'when trigger belongs to no one' do
        let(:user) {}
        let(:trigger_request) { create(:ci_trigger_request) }

        it 'does not create a pipeline' 

      end

      context 'when trigger belongs to a developer' do
        let(:user) { create(:user) }
        let(:trigger) { create(:ci_trigger, owner: user) }
        let(:trigger_request) { create(:ci_trigger_request, trigger: trigger) }

        before do
          project.add_developer(user)
        end

        it 'does not create a pipeline' 

      end

      context 'when trigger belongs to a maintainer' do
        let(:user) { create(:user) }
        let(:trigger) { create(:ci_trigger, owner: user) }
        let(:trigger_request) { create(:ci_trigger_request, trigger: trigger) }

        before do
          project.add_maintainer(user)
        end

        it 'creates a pipeline' 

      end
    end

    context 'when ref is a protected branch' do
      before do
        create(:protected_branch, project: project, name: 'master')
      end

      it_behaves_like 'when ref is protected'
    end

    context 'when ref is a protected tag' do
      let(:ref_name) { 'refs/tags/v1.0.0' }

      before do
        create(:protected_tag, project: project, name: '*')
      end

      it_behaves_like 'when ref is protected'
    end

    context 'when ref is not protected' do
      context 'when trigger belongs to no one' do
        let(:user) {}
        let(:trigger) { create(:ci_trigger, owner: nil) }
        let(:trigger_request) { create(:ci_trigger_request, trigger: trigger) }
        let(:pipeline) { execute_service(trigger_request: trigger_request) }

        it 'creates an unprotected pipeline' 

      end
    end

    context 'when pipeline is running for a tag' do
      before do
        config = YAML.dump(test: { script: 'test', only: ['branches'] },
                           deploy: { script: 'deploy', only: ['tags'] })

        stub_ci_pipeline_yaml_file(config)
      end

      it 'creates a tagged pipeline' 

    end

    context 'when pipeline variables are specified' do
      let(:variables_attributes) do
        [{ key: 'first', secret_value: 'world' },
         { key: 'second', secret_value: 'second_world' }]
      end

      subject { execute_service(variables_attributes: variables_attributes) }

      it 'creates a pipeline with specified variables' 

    end
  end
end

