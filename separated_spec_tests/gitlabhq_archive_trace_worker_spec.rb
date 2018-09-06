require 'spec_helper'

describe ArchiveTraceWorker do
  describe '#perform' do
    subject { described_class.new.perform(job&.id) }

    context 'when job is found' do
      let(:job) { create(:ci_build) }

      it 'executes service' 

    end

    context 'when job is not found' do
      let(:job) { nil }

      it 'does not execute service' 

    end
  end
end

