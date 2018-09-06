require 'spec_helper'

describe Gitlab::SidekiqLogging::StructuredLogger do
  describe '#call' do
    let(:timestamp) { Time.new('2018-01-01 12:00:00').utc }
    let(:job) do
      {
        "class" => "TestWorker",
        "args" => [1234, 'hello'],
        "retry" => false,
        "queue" => "cronjob:test_queue",
        "queue_namespace" => "cronjob",
        "jid" => "da883554ee4fe414012f5f42",
        "created_at" => timestamp.to_f,
        "enqueued_at" => timestamp.to_f
      }
    end
    let(:logger) { double() }
    let(:start_payload) do
      job.merge(
        'message' => 'TestWorker JID-da883554ee4fe414012f5f42: start',
        'job_status' => 'start',
        'pid' => Process.pid,
        'created_at' => timestamp.iso8601(3),
        'enqueued_at' => timestamp.iso8601(3)
      )
    end
    let(:end_payload) do
      start_payload.merge(
        'message' => 'TestWorker JID-da883554ee4fe414012f5f42: done: 0.0 sec',
        'job_status' => 'done',
        'duration' => 0.0,
        "completed_at" => timestamp.iso8601(3)
      )
    end
    let(:exception_payload) do
      end_payload.merge(
        'message' => 'TestWorker JID-da883554ee4fe414012f5f42: fail: 0.0 sec',
        'job_status' => 'fail',
        'error' => ArgumentError,
        'error_message' => 'some exception'
      )
    end

    before do
      allow(Sidekiq).to receive(:logger).and_return(logger)

      allow(subject).to receive(:current_time).and_return(timestamp.to_f)
    end

    subject { described_class.new }

    context 'with SIDEKIQ_LOG_ARGUMENTS enabled' do
      before do
        stub_env('SIDEKIQ_LOG_ARGUMENTS', '1')
      end

      it 'logs start and end of job' 


      it 'logs an exception in job' 

    end

    context 'with SIDEKIQ_LOG_ARGUMENTS disabled' do
      it 'logs start and end of job' 

    end
  end
end

