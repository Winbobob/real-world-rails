require 'spec_helper'

describe Gitlab::Metrics::System do
  if File.exist?('/proc')
    describe '.memory_usage' do
      it "returns the process' memory usage in bytes" 

    end

    describe '.file_descriptor_count' do
      it 'returns the amount of open file descriptors' 

    end
  else
    describe '.memory_usage' do
      it 'returns 0.0' 

    end

    describe '.file_descriptor_count' do
      it 'returns 0' 

    end
  end

  describe '.cpu_time' do
    it 'returns a Fixnum' 

  end

  describe '.real_time' do
    it 'returns a Fixnum' 

  end

  describe '.monotonic_time' do
    it 'returns a Float' 

  end
end

