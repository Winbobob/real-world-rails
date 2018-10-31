require 'spec_helper'

describe Gitlab::Ci::Pipeline::Chain::Create do
  set(:project) { create(:project) }
  set(:user) { create(:user) }

  let(:pipeline) do
    build(:ci_empty_pipeline, project: project, ref: 'master')
  end

  let(:command) do
    Gitlab::Ci::Pipeline::Chain::Command.new(
      project: project, current_user: user)
  end

  let(:step) { described_class.new(pipeline, command) }

  context 'when pipeline is ready to be saved' do
    before do
      pipeline.stages.build(name: 'test', position: 0, project: project)

      step.perform!
    end

    it 'saves a pipeline' 


    it 'does not break the chain' 


    it 'creates stages' 

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

  end
end

