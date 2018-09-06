require 'spec_helper'

describe Gitlab::Sherlock::LineProfiler do
  let(:profiler) { described_class.new }

  describe '#profile' do
    it 'runs the profiler when using MRI' 


    it 'raises NotImplementedError when profiling an unsupported platform' 

  end

  describe '#profile_mri' do
    it 'returns an Array containing the return value and profiling samples' 

  end

  describe '#aggregate_rblineprof' do
    let(:raw_samples) do
      { __FILE__ => [[30000, 30000, 5, 0], [15000, 15000, 4, 0]] }
    end

    it 'returns an Array of FileSample objects' 


    describe 'the first FileSample object' do
      let(:file_sample) do
        profiler.aggregate_rblineprof(raw_samples)[0]
      end

      it 'uses the correct file path' 


      it 'contains a list of line samples' 


      it 'contains the total file execution time' 


      it 'contains the total amount of file events' 

    end
  end
end

