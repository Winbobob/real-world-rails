# encoding: utf-8

require_relative '../../lib/service_usage_metrics'
require 'mock_redis'
require_relative '../../../../spec/rspec_configuration'

describe CartoDB::ServiceUsageMetrics do

  class DummyServiceUsageMetrics < CartoDB::ServiceUsageMetrics
    VALID_METRICS = [:dummy_metric].freeze
    VALID_SERVICES = [:dummy_service].freeze

    def check_valid_data(service, metric)
      raise ArgumentError.new('Invalid service') unless VALID_SERVICES.include?(service)
      raise ArgumentError.new('Invalid metric') unless VALID_METRICS.include?(metric)
    end
  end

  before(:each) do
    @redis_mock = MockRedis.new
    @usage_metrics = DummyServiceUsageMetrics.new('rtorre', 'team', @redis_mock)
  end

  describe 'Read quota info from redis with zero padding' do

    it 'reads standard zero padded keys' 


    it "does not request redis twice when there's no need" 


    it "returns zero when there's no consumption" 

  end

  describe :assert_valid_amount do
    it 'passes when fed with a positive integer' 


    it 'validates that the amount passed cannot be nil' 


    it 'validates that the amount passed cannot be negative' 


    it 'validates that the amount passed can actually be zero' 

  end

  describe :incr do
    it 'validates that the amount passed can actually be zero' 

  end

  describe '#get_sum_by_date_range' do
    it 'gets a sum of the zscores stored in a given date range' 


    it 'gracefully deals with days without record' 


    it 'gracefully deals with months not stored in redis' 


    it 'performs just one request/month to redis' 


    it 'returns zero when there are no records' 

  end

  describe '#get_date_range' do
    it 'gets a hash of date => value pairs' 


    it 'gracefully deals with days without record' 


    it 'gracefully deals with months not stored in redis' 


    it 'performs just one request/month to redis' 


    it 'returns zero when there are no records' 

  end
end

