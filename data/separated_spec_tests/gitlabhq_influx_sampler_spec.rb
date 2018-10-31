require 'spec_helper'

describe Gitlab::Metrics::Samplers::InfluxSampler do
  let(:sampler) { described_class.new(5) }

  after do
    Allocations.stop if Gitlab::Metrics.mri?
  end

  describe '#start' do
    it 'runs once and gathers a sample at a given interval' 

  end

  describe '#sample' do
    it 'samples various statistics' 


    it 'clears any GC profiles' 

  end

  describe '#flush' do
    it 'schedules the metrics using Sidekiq' 

  end

  describe '#sample_memory_usage' do
    it 'adds a metric containing the memory usage' 

  end

  describe '#sample_file_descriptors' do
    it 'adds a metric containing the amount of open file descriptors' 

  end

  describe '#sample_gc' do
    it 'adds a metric containing garbage collection statistics' 

  end

  describe '#add_metric' do
    it 'prefixes the series name for a Rails process' 


    it 'prefixes the series name for a Sidekiq process' 

  end

  describe '#sleep_interval' do
    it 'returns a Numeric' 


    # Testing random behaviour is very hard, so treat this test as a basic smoke
    # test instead of a very accurate behaviour/unit test.
    it 'does not return the same interval twice in a row' 

  end
end

