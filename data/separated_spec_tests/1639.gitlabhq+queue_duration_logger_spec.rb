require 'spec_helper'

describe Gitlab::GrapeLogging::Loggers::QueueDurationLogger do
  subject { described_class.new }

  describe ".parameters" do
    let(:start_time) { Time.new(2018, 01, 01) }

    describe 'when no proxy time is available' do
      let(:mock_request) { OpenStruct.new(env: {}) }

      it 'returns an empty hash' 

    end

    describe 'when a proxy time is available' do
      let(:mock_request) do
        OpenStruct.new(
          env: {
            'HTTP_GITLAB_WORKHORSE_PROXY_START' => (start_time - 1.hour).to_i * (10**9)
          }
        )
      end

      it 'returns the correct duration in ms' 

    end
  end
end

