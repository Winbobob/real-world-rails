require 'spec_helper'

describe Ci::UpdateRunnerService do
  let(:runner) { create(:ci_runner) }

  describe '#update' do
    before do
      allow(runner).to receive(:tick_runner_queue)
    end

    context 'with description params' do
      let(:params) { { description: 'new runner' } }

      it 'updates the runner and ticking the queue' 

    end

    context 'when params are not valid' do
      let(:params) { { run_untagged: false } }

      it 'does not update and give false because it is not valid' 

    end

    def update
      described_class.new(runner).update(params)
    end
  end
end

