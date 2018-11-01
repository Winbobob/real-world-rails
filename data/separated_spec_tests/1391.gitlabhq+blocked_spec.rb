require 'spec_helper'

describe Gitlab::Ci::Status::Pipeline::Blocked do
  let(:pipeline) { double('pipeline') }

  subject do
    described_class.new(pipeline)
  end

  describe '#text' do
    it 'overrides status text' 

  end

  describe '#label' do
    it 'overrides status label' 

  end

  describe '.matches?' do
    let(:user) { double('user') }
    subject { described_class.matches?(pipeline, user) }

    context 'when pipeline is blocked' do
      let(:pipeline) { create(:ci_pipeline, :blocked) }

      it 'is a correct match' 

    end

    context 'when pipeline is not blocked' do
      let(:pipeline) { create(:ci_pipeline, :success) }

      it 'does not match' 

    end
  end
end

