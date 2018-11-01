require 'spec_helper'

describe Gitlab::OptimisticLocking do
  let!(:pipeline) { create(:ci_pipeline) }
  let!(:pipeline2) { Ci::Pipeline.find(pipeline.id) }

  describe '#retry_lock' do
    it 'does not reload object if state changes' 


    it 'retries action if exception is raised' 


    it 'raises exception when too many retries' 

  end

  describe '#retry_optimistic_lock' do
    context 'when locking module is mixed in' do
      let(:unlockable) do
        Class.new.include(described_class).new
      end

      it 'is an alias for retry_lock' 

    end
  end
end

