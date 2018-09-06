require 'spec_helper'

describe Gitlab::Ci::Pipeline::Chain::Sequence do
  set(:project) { create(:project) }
  set(:user) { create(:user) }

  let(:pipeline) { build_stubbed(:ci_pipeline) }
  let(:command) { Gitlab::Ci::Pipeline::Chain::Command.new }
  let(:first_step) { spy('first step') }
  let(:second_step) { spy('second step') }
  let(:sequence) { [first_step, second_step] }

  subject do
    described_class.new(pipeline, command, sequence)
  end

  context 'when one of steps breaks the chain' do
    before do
      allow(first_step).to receive(:break?).and_return(true)
    end

    it 'does not process the second step' 


    it 'returns a pipeline object' 

  end

  context 'when all chains are executed correctly' do
    before do
      sequence.each do |step|
        allow(step).to receive(:break?).and_return(false)
      end
    end

    it 'iterates through entire sequence' 


    it 'returns a pipeline object' 

  end
end

