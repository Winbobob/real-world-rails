require 'spec_helper'

describe Gitlab::Ci::Build::Policy::Variables do
  set(:project) { create(:project) }

  let(:pipeline) do
    build(:ci_empty_pipeline, project: project, ref: 'master', source: :push)
  end

  let(:ci_build) do
    build(:ci_build, pipeline: pipeline, project: project, ref: 'master')
  end

  let(:seed) { double('build seed', to_resource: ci_build) }

  before do
    pipeline.variables.build(key: 'CI_PROJECT_NAME', value: '')
  end

  describe '#satisfied_by?' do
    it 'is satisfied by at least one matching statement' 


    it 'is not satisfied by an overriden empty variable' 


    it 'is satisfied by a truthy pipeline expression' 


    it 'is not satisfied by a falsy pipeline expression' 


    it 'is satisfied by a truthy expression using undefined variable' 


    it 'is not satisfied by a falsy expression using undefined variable' 


    it 'allows to evaluate regular CI variables' 


    it 'does not persist neither pipeline nor build' 

  end
end

