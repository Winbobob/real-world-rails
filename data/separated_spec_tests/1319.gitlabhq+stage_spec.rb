require 'spec_helper'

describe Gitlab::Ci::Pipeline::Seed::Stage do
  let(:pipeline) { create(:ci_empty_pipeline) }

  let(:attributes) do
    { name: 'test',
      index: 0,
      builds: [{ name: 'rspec' },
               { name: 'spinach' },
               { name: 'deploy', only: { refs: ['feature'] } }] }
  end

  subject do
    described_class.new(pipeline, attributes)
  end

  describe '#size' do
    it 'returns a number of jobs in the stage' 

  end

  describe '#attributes' do
    it 'returns hash attributes of a stage' 

  end

  describe '#included?' do
    context 'when it contains builds seeds' do
      let(:attributes) do
        { name: 'test',
          index: 0,
          builds: [{ name: 'deploy', only: { refs: ['master'] } }] }
      end

      it { is_expected.to be_included }
    end

    context 'when it does not contain build seeds' do
      let(:attributes) do
        { name: 'test',
          index: 0,
          builds: [{ name: 'deploy', only: { refs: ['feature'] } }] }
      end

      it { is_expected.not_to be_included }
    end
  end

  describe '#seeds' do
    it 'returns build seeds' 


    it 'returns build seeds including valid attributes' 


    context 'when a ref is protected' do
      before do
        allow_any_instance_of(Project).to receive(:protected_for?).and_return(true)
      end

      it 'returns protected builds' 

    end

    context 'when a ref is not protected' do
      before do
        allow_any_instance_of(Project).to receive(:protected_for?).and_return(false)
      end

      it 'returns unprotected builds' 

    end

    it 'filters seeds using only/except policies' 

  end

  describe '#to_resource' do
    it 'builds a valid stage object with all builds' 


    it 'can not be persisted without explicit pipeline assignment' 

  end
end

