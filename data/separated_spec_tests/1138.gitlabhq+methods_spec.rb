require 'spec_helper'

describe Gitlab::Metrics::Methods do
  subject { Class.new { include Gitlab::Metrics::Methods } }

  shared_context 'metric' do |metric_type, *args|
    let(:docstring) { 'description' }
    let(:metric_name) { :sample_metric }

    describe "#define_#{metric_type}" do
      define_method(:call_define_metric_method) do |**args|
        subject.__send__("define_#{metric_type}", metric_name, **args)
      end

      context 'metrics access method not defined' do
        it "defines metrics accessing method" 

      end

      context 'metrics access method defined' do
        before do
          call_define_metric_method(docstring: docstring)
        end

        it 'raises error when trying to redefine method' 


        context 'metric is not cached' do
          it 'calls fetch_metric' 

        end

        context 'metric is cached' do
          before do
            subject.public_send(metric_name)
          end

          it 'returns cached metric' 

        end
      end
    end

    describe "#fetch_#{metric_type}" do
      let(:null_metric) { Gitlab::Metrics::NullMetric.instance }

      define_method(:call_fetch_metric_method) do |**args|
        subject.__send__("fetch_#{metric_type}", metric_name, **args)
      end

      context "when #{metric_type} is not cached" do
        it 'initializes counter metric' 

      end

      context "when #{metric_type} is cached" do
        before do
          call_fetch_metric_method(docstring: docstring)
        end

        it 'uses class metric cache' 


        context 'when metric is reloaded' do
          before do
            subject.reload_metric!(metric_name)
          end

          it "initializes #{metric_type} metric" 

        end
      end

      context 'when metric is configured with feature' do
        let(:feature_name) { :some_metric_feature }
        let(:metric) { call_fetch_metric_method(docstring: docstring, with_feature: feature_name) }

        context 'when feature is enabled' do
          before do
            Feature.get(feature_name).enable
          end

          it "initializes #{metric_type} metric" 

        end

        context 'when feature is disabled' do
          before do
            Feature.get(feature_name).disable
          end

          it "returns NullMetric" 

        end
      end
    end
  end

  include_examples 'metric', :counter, {}
  include_examples 'metric', :gauge, {}, :all
  include_examples 'metric', :histogram, {}, [0.005, 0.01, 0.1, 1, 10]
end

