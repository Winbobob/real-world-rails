require 'spec_helper'

describe ApplicationWorker do
  let(:worker) do
    Class.new do
      def self.name
        'Gitlab::Foo::Bar::DummyWorker'
      end

      include ApplicationWorker
    end
  end

  describe 'Sidekiq options' do
    it 'sets the queue name based on the class name' 

  end

  describe '.queue_namespace' do
    it 'sets the queue name based on the class name' 

  end

  describe '.queue' do
    it 'returns the queue name' 

  end

  describe '.bulk_perform_async' do
    it 'enqueues jobs in bulk' 

  end

  describe '.bulk_perform_in' do
    context 'when delay is valid' do
      it 'correctly schedules jobs' 

    end

    context 'when delay is invalid' do
      it 'raises an ArgumentError exception' 

    end
  end
end

