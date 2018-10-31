require 'spec_helper'

describe Gitlab::GithubImport::AdvanceStageWorker, :clean_gitlab_redis_shared_state do
  let(:project) { create(:project) }
  let(:import_state) { create(:import_state, project: project, jid: '123') }
  let(:worker) { described_class.new }

  describe '#perform' do
    context 'when the project no longer exists' do
      it 'does not perform any work' 

    end

    context 'when there are remaining jobs' do
      before do
        allow(worker)
          .to receive(:find_project)
          .and_return(project)
      end

      it 'reschedules itself' 

    end

    context 'when there are no remaining jobs' do
      before do
        allow(worker)
          .to receive(:find_project)
          .and_return(project)

        allow(worker)
          .to receive(:wait_for_jobs)
          .with({ '123' => 2 })
          .and_return({})
      end

      it 'schedules the next stage' 


      it 'raises KeyError when the stage name is invalid' 

    end
  end

  describe '#wait_for_jobs' do
    it 'waits for jobs to complete and returns a new pair of keys to wait for' 

  end

  describe '#find_project' do
    it 'returns a Project' 


    it 'returns nil if the project import is not running' 

  end
end

