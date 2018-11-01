require 'spec_helper'

describe Gitlab::Ci::Pipeline::Chain::Validate::Config do
  set(:project) { create(:project, :repository) }
  set(:user) { create(:user) }

  let(:command) do
    Gitlab::Ci::Pipeline::Chain::Command.new(
      project: project,
      current_user: user,
      save_incompleted: true)
  end

  let!(:step) { described_class.new(pipeline, command) }

  before do
    step.perform!
  end

  context 'when pipeline has no YAML configuration' do
    let(:pipeline) do
      build_stubbed(:ci_pipeline, project: project)
    end

    it 'appends errors about missing configuration' 


    it 'breaks the chain' 

  end

  context 'when YAML configuration contains errors' do
    let(:pipeline) do
      build(:ci_pipeline, project: project, config: 'invalid YAML')
    end

    it 'appends errors about YAML errors' 


    it 'breaks the chain' 


    context 'when saving incomplete pipeline is allowed' do
      let(:command) do
        double('command', project: project,
                          current_user: user,
                          save_incompleted: true)
      end

      it 'fails the pipeline' 


      it 'sets a config error failure reason' 

    end

    context 'when saving incomplete pipeline is not allowed' do
      let(:command) do
        double('command', project: project,
                          current_user: user,
                          save_incompleted: false)
      end

      it 'does not drop pipeline' 

    end
  end

  context 'when pipeline contains configuration validation errors' do
    let(:config) { { rspec: {} } }

    let(:pipeline) do
      build(:ci_pipeline, project: project, config: config)
    end

    it 'appends configuration validation errors to pipeline errors' 


    it 'breaks the chain' 

  end

  context 'when pipeline is correct and complete' do
    let(:pipeline) do
      build(:ci_pipeline_with_one_job, project: project)
    end

    it 'does not invalidate the pipeline' 


    it 'does not break the chain' 

  end
end

