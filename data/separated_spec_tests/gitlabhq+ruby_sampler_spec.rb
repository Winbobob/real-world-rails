require 'spec_helper'

describe Gitlab::Metrics::Samplers::RubySampler do
  let(:sampler) { described_class.new(5) }
  let(:null_metric) { double('null_metric', set: nil, observe: nil) }

  before do
    allow(Gitlab::Metrics::NullMetric).to receive(:instance).and_return(null_metric)
  end

  describe '#sample' do
    it 'samples various statistics' 


    it 'adds a metric containing the memory usage' 


    it 'adds a metric containing the amount of open file descriptors' 


    it 'clears any GC profiles' 

  end

  describe '#sample_gc' do
    it 'adds a metric containing garbage collection time statistics' 


    it 'adds a metric containing garbage collection statistics' 

  end
end

