require 'spec_helper'

describe Gitlab::Ci::Pipeline::Chain::Skip do
  set(:project) { create(:project) }
  set(:user) { create(:user) }
  set(:pipeline) { create(:ci_pipeline, project: project) }

  let(:command) do
    Gitlab::Ci::Pipeline::Chain::Command.new(
      project: project,
      current_user: user,
      ignore_skip_ci: false,
      save_incompleted: true)
  end

  let(:step) { described_class.new(pipeline, command) }

  context 'when pipeline has been skipped by a user' do
    before do
      allow(pipeline).to receive(:git_commit_message)
        .and_return('commit message [ci skip]')

      step.perform!
    end

    it 'should break the chain' 


    it 'skips the pipeline' 

  end

  context 'when pipeline has not been skipped' do
    before do
      step.perform!
    end

    it 'should not break the chain' 


    it 'should not skip a pipeline chain' 

  end

  context 'when [ci skip] should be ignored' do
    let(:command) do
      double('command', project: project,
                        current_user: user,
                        ignore_skip_ci: true)
    end

    it 'does not break the chain' 

  end

  context 'when pipeline should be skipped but not persisted' do
    let(:command) do
      double('command', project: project,
                        current_user: user,
                        ignore_skip_ci: false,
                        save_incompleted: false)
    end

    before do
      allow(pipeline).to receive(:git_commit_message)
        .and_return('commit message [ci skip]')

      step.perform!
    end

    it 'breaks the chain' 


    it 'does not skip pipeline' 

  end
end

