require 'spec_helper'

describe Gitlab::Metrics::BackgroundTransaction do
  let(:test_worker_class) { double(:class, name: 'TestWorker') }

  subject { described_class.new(test_worker_class) }

  describe '#action' do
    it 'returns transaction action name' 

  end

  describe '#label' do
    it 'returns labels based on class name' 

  end
end

