require 'spec_helper'

describe Gitlab::Database::MultiThreadedMigration do
  let(:migration) do
    Class.new { include Gitlab::Database::MultiThreadedMigration }.new
  end

  describe '#connection' do
    after do
      Thread.current[described_class::MULTI_THREAD_AR_CONNECTION] = nil
    end

    it 'returns the thread-local connection if present' 


    it 'returns the global connection if no thread-local connection was set' 

  end

  describe '#with_multiple_threads' do
    it 'starts multiple threads and yields the supplied block in every thread' 


    it 'joins the threads when the join parameter is set' 

  end
end

