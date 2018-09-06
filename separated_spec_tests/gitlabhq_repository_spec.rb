require 'spec_helper'

describe Gitlab::Ci::Pipeline::Chain::Validate::Repository do
  set(:project) { create(:project, :repository) }
  set(:user) { create(:user) }
  let(:pipeline) { build_stubbed(:ci_pipeline) }

  let!(:step) { described_class.new(pipeline, command) }

  before do
    step.perform!
  end

  context 'when ref and sha exists' do
    let(:command) do
      Gitlab::Ci::Pipeline::Chain::Command.new(
        project: project, current_user: user, origin_ref: 'master', checkout_sha: project.commit.id)
    end

    it 'does not break the chain' 


    it 'does not append pipeline errors' 

  end

  context 'when ref does not exist' do
    let(:command) do
      Gitlab::Ci::Pipeline::Chain::Command.new(
        project: project, current_user: user, origin_ref: 'something')
    end

    it 'breaks the chain' 


    it 'adds an error about missing ref' 

  end

  context 'when does not have existing SHA set' do
    let(:command) do
      Gitlab::Ci::Pipeline::Chain::Command.new(
        project: project, current_user: user, origin_ref: 'master', checkout_sha: 'something')
    end

    it 'breaks the chain' 


    it 'adds an error about missing SHA' 

  end
end

