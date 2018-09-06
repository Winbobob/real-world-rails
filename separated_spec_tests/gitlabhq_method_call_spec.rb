require 'spec_helper'

describe Gitlab::Metrics::MethodCall do
  let(:transaction) { double(:transaction, labels: {}) }
  let(:method_call) { described_class.new('Foo#bar', :Foo, '#bar', transaction) }

  describe '#measure' do
    after do
      described_class.reload_metric!(:gitlab_method_call_duration_seconds)
    end

    it 'measures the performance of the supplied block' 


    context 'when measurement is above threshold' do
      before do
        allow(method_call).to receive(:above_threshold?).and_return(true)
      end

      context 'prometheus instrumentation is enabled' do
        before do
          Feature.get(:prometheus_metrics_method_instrumentation).enable
        end

        around do |example|
          Timecop.freeze do
            example.run
          end
        end

        it 'metric is not a NullMetric' 


        it 'observes the performance of the supplied block' 

      end

      context 'prometheus instrumentation is disabled' do
        before do
          Feature.get(:prometheus_metrics_method_instrumentation).disable
        end

        it 'observes using NullMetric' 

      end
    end

    context 'when measurement is below threshold' do
      before do
        allow(method_call).to receive(:above_threshold?).and_return(false)
      end

      it 'does not observe the performance' 

    end
  end

  describe '#to_metric' do
    it 'returns a Metric instance' 

  end

  describe '#above_threshold?' do
    before do
      allow(Gitlab::Metrics).to receive(:method_call_threshold).and_return(100)
    end

    it 'returns false when the total call time is not above the threshold' 


    it 'returns true when the total call time is above the threshold' 

  end

  describe '#call_count' do
    context 'without any method calls' do
      it 'returns 0' 

    end

    context 'with method calls' do
      it 'returns the number of method calls' 

    end
  end

  describe '#cpu_time' do
    context 'without timings' do
      it 'returns 0.0' 

    end

    context 'with timings' do
      it 'returns the total CPU time' 

    end
  end

  describe '#real_time' do
    context 'without timings' do
      it 'returns 0.0' 

    end

    context 'with timings' do
      it 'returns the total real time' 

    end
  end
end

