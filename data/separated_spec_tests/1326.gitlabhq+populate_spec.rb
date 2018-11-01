require 'spec_helper'

describe Gitlab::Ci::Pipeline::Chain::Populate do
  set(:project) { create(:project, :repository) }
  set(:user) { create(:user) }

  let(:pipeline) do
    build(:ci_pipeline_with_one_job, project: project,
                                     ref: 'master',
                                     user: user)
  end

  let(:command) do
    Gitlab::Ci::Pipeline::Chain::Command.new(
      project: project,
      current_user: user,
      seeds_block: nil)
  end

  let(:step) { described_class.new(pipeline, command) }

  context 'when pipeline doesn not have seeds block' do
    before do
      step.perform!
    end

    it 'does not persist the pipeline' 


    it 'does not break the chain' 


    it 'populates pipeline with stages' 


    it 'correctly assigns user' 


    it 'has pipeline iid' 

  end

  context 'when pipeline is empty' do
    let(:config) do
      { rspec: {
          script: 'ls',
          only: ['something']
      } }
    end

    let(:pipeline) do
      build(:ci_pipeline, project: project, config: config)
    end

    before do
      step.perform!
    end

    it 'breaks the chain' 


    it 'appends an error about missing stages' 


    it 'wastes pipeline iid' 

  end

  context 'when pipeline has validation errors' do
    let(:pipeline) do
      build(:ci_pipeline, project: project, ref: nil)
    end

    before do
      step.perform!
    end

    it 'breaks the chain' 


    it 'appends validation error' 


    it 'wastes pipeline iid' 

  end

  context 'when there is a seed blocks present' do
    let(:command) do
      Gitlab::Ci::Pipeline::Chain::Command.new(
        project: project,
        current_user: user,
        seeds_block: seeds_block)
    end

    context 'when seeds block builds some resources' do
      let(:seeds_block) do
        ->(pipeline) { pipeline.variables.build(key: 'VAR', value: '123') }
      end

      it 'populates pipeline with resources described in the seeds block' 


      it 'has pipeline iid' 

    end

    context 'when seeds block tries to persist some resources' do
      let(:seeds_block) do
        ->(pipeline) { pipeline.variables.create!(key: 'VAR', value: '123') }
      end

      it 'raises exception' 


      it 'wastes pipeline iid' 

    end
  end

  context 'when pipeline gets persisted during the process' do
    let(:pipeline) { create(:ci_pipeline, project: project) }

    it 'raises error' 

  end

  context 'when variables policy is specified' do
    shared_examples_for 'a correct pipeline' do
      it 'populates pipeline according to used policies' 

    end

    context 'when using only/except build policies' do
      let(:config) do
        { rspec: { script: 'rspec', stage: 'test', only: ['master'] },
          prod: { script: 'cap prod', stage: 'deploy', only: ['tags'] } }
      end

      let(:pipeline) do
        build(:ci_pipeline, ref: 'master', project: project, config: config)
      end

      it_behaves_like 'a correct pipeline'

      context 'when variables expression is specified' do
        context 'when pipeline iid is the subject' do
          let(:config) do
            { rspec: { script: 'rspec', only: { variables: ["$CI_PIPELINE_IID == '1'"] } },
              prod: { script: 'cap prod', only: { variables: ["$CI_PIPELINE_IID == '1000'"] } } }
          end

          it_behaves_like 'a correct pipeline'
        end
      end
    end
  end
end

