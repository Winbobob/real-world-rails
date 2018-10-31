require 'spec_helper'

describe Gitlab::Metrics::Metric do
  let(:metric) do
    described_class.new('foo', { number: 10 }, { host: 'localtoast' })
  end

  describe '#series' do
    subject { metric.series }

    it { is_expected.to eq('foo') }
  end

  describe '#values' do
    subject { metric.values }

    it { is_expected.to eq({ number: 10 }) }
  end

  describe '#tags' do
    subject { metric.tags }

    it { is_expected.to eq({ host: 'localtoast' }) }
  end

  describe '#type' do
    subject { metric.type }

    it { is_expected.to eq(:metric) }
  end

  describe '#event?' do
    it 'returns false for a regular metric' 


    it 'returns true for an event metric' 

  end

  describe '#to_hash' do
    it 'returns a Hash' 


    describe 'the returned Hash' do
      let(:hash) { metric.to_hash }

      it 'includes the series' 


      it 'includes the tags' 


      it 'includes the values' 


      it 'includes the timestamp' 

    end
  end
end

