# encoding: utf-8
require_relative '../../../simplecov_helper'
require 'rspec/core'
require 'rspec/expectations'
require 'rspec/mocks'
require_relative '../../../rspec_configuration.rb'

require_relative '../../../../lib/cartodb/stats/importer'

include Mocha::ParameterMatchers

module CartoDB
  module Stats
    describe Importer do
      TEST_HOST = '172.28.128.3'.freeze
      TEST_PORT = 8125
      TIMING_TEST_KEY_A = 'test'.freeze
      TIMING_TEST_KEY_B = 'timing'.freeze
      TIMING_TEST_KEY = "#{TIMING_TEST_KEY_A}.#{TIMING_TEST_KEY_B}".freeze
      GAUGE_TEST_KEY = 'gauge'.freeze
      GAUGE_TEST_VALUE = 0.5
      HOST_INFO = "fake-test-queue".freeze

      EXPECTED_PREFIX = "importer.#{HOST_INFO}".freeze

      describe '#timing' do
        it "sends key with importer prefix" 


        it "doesn't send anything if host or port are not met" 


        it "runs block even without host or port" 


        it "registers nested timing" 


        it 'sends nothing and discards key fragment if block fails' 

      end

      describe '#gauge' do
        it 'sends key with importer prefix' 


        it "doesn't send anything if host or port are not met" 

      end

      def foo
        sleep 0.001
      end

      def expected_send(buf)
        buf_re = %r{^#{buf}:}
        UDPSocket.any_instance.expects(:send).with(regexp_matches(buf_re), 0, TEST_HOST, TEST_PORT).once
      end

      def expected_send_nothing
        UDPSocket.any_instance.expects(:send).never
      end
    end
  end
end

