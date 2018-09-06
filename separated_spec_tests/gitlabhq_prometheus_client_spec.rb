require 'spec_helper'

describe Gitlab::PrometheusClient do
  include PrometheusHelpers

  subject { described_class.new(RestClient::Resource.new('https://prometheus.example.com')) }

  describe '#ping' do
    it 'issues a "query" request to the API endpoint' 

  end

  # This shared examples expect:
  # - query_url: A query URL
  # - execute_query: A query call
  shared_examples 'failure response' do
    context 'when request returns 400 with an error message' do
      it 'raises a Gitlab::PrometheusClient::Error error' 

    end

    context 'when request returns 400 without an error message' do
      it 'raises a Gitlab::PrometheusClient::Error error' 

    end

    context 'when request returns 500' do
      it 'raises a Gitlab::PrometheusClient::Error error' 

    end

    context 'when request returns non json data' do
      it 'raises a Gitlab::PrometheusClient::Error error' 

    end
  end

  describe 'failure to reach a provided prometheus url' do
    let(:prometheus_url) {"https://prometheus.invalid.example.com"}

    subject { described_class.new(RestClient::Resource.new(prometheus_url)) }

    context 'exceptions are raised' do
      it 'raises a Gitlab::PrometheusClient::Error error when a SocketError is rescued' 


      it 'raises a Gitlab::PrometheusClient::Error error when a SSLError is rescued' 


      it 'raises a Gitlab::PrometheusClient::Error error when a RestClient::Exception is rescued' 

    end
  end

  describe '#query' do
    let(:prometheus_query) { prometheus_cpu_query('env-slug') }
    let(:query_url) { prometheus_query_with_time_url(prometheus_query, Time.now.utc) }

    around do |example|
      Timecop.freeze { example.run }
    end

    context 'when request returns vector results' do
      it 'returns data from the API call' 

    end

    context 'when request returns matrix results' do
      it 'returns nil' 

    end

    context 'when request returns no data' do
      it 'returns []' 

    end

    it_behaves_like 'failure response' do
      let(:execute_query) { subject.query(prometheus_query) }
    end
  end

  describe '#series' do
    let(:query_url) { prometheus_series_url('series_name', 'other_service') }

    around do |example|
      Timecop.freeze { example.run }
    end

    it 'calls endpoint and returns list of series' 

  end

  describe '#label_values' do
    let(:query_url) { prometheus_label_values_url('__name__') }

    it 'calls endpoint and returns label values' 

  end

  describe '#query_range' do
    let(:prometheus_query) { prometheus_memory_query('env-slug') }
    let(:query_url) { prometheus_query_range_url(prometheus_query) }

    around do |example|
      Timecop.freeze { example.run }
    end

    context 'when non utc time is passed' do
      let(:time_stop) { Time.now.in_time_zone("Warsaw") }
      let(:time_start) { time_stop - 8.hours }

      let(:query_url) { prometheus_query_range_url(prometheus_query, start: time_start.utc.to_f, stop: time_stop.utc.to_f) }

      it 'passed dates are properly converted to utc' 

    end

    context 'when a start time is passed' do
      let(:query_url) { prometheus_query_range_url(prometheus_query, start: 2.hours.ago) }

      it 'passed it in the requested URL' 

    end

    context 'when request returns vector results' do
      it 'returns nil' 

    end

    context 'when request returns matrix results' do
      it 'returns data from the API call' 

    end

    context 'when request returns no data' do
      it 'returns []' 

    end

    it_behaves_like 'failure response' do
      let(:execute_query) { subject.query_range(prometheus_query) }
    end
  end
end

