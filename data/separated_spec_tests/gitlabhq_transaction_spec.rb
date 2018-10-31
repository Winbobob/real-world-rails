require 'spec_helper'

describe Gitlab::Sherlock::Transaction do
  let(:transaction) { described_class.new('POST', '/cat_pictures') }

  describe '#id' do
    it 'returns the transaction ID' 

  end

  describe '#type' do
    it 'returns the type' 

  end

  describe '#path' do
    it 'returns the path' 

  end

  describe '#queries' do
    it 'returns an Array of queries' 

  end

  describe '#file_samples' do
    it 'returns an Array of file samples' 

  end

  describe '#started_at' do
    it 'returns the start time' 

  end

  describe '#finished_at' do
    it 'returns the completion time' 

  end

  describe '#view_counts' do
    it 'returns a Hash' 


    it 'sets the default value of a key to 0' 

  end

  describe '#run' do
    it 'runs the transaction' 

  end

  describe '#duration' do
    it 'returns the duration in seconds' 

  end

  describe '#query_duration' do
    it 'returns the total query duration in seconds' 

  end

  describe '#to_param' do
    it 'returns the transaction ID' 

  end

  describe '#sorted_queries' do
    it 'returns the queries in descending order' 

  end

  describe '#sorted_file_samples' do
    it 'returns the file samples in descending order' 

  end

  describe '#find_query' do
    it 'returns a Query when found' 


    it 'returns nil when no query could be found' 

  end

  describe '#find_file_sample' do
    it 'returns a FileSample when found' 


    it 'returns nil when no file sample could be found' 

  end

  describe '#profile_lines' do
    describe 'when line profiling is enabled' do
      it 'yields the block using the line profiler' 

    end

    describe 'when line profiling is disabled' do
      it 'yields the block' 

    end
  end

  describe '#subscribe_to_active_record' do
    let(:subscription) { transaction.subscribe_to_active_record }
    let(:time) { Time.now }
    let(:query_data) { { sql: 'SELECT 1', binds: [] } }

    after do
      ActiveSupport::Notifications.unsubscribe(subscription)
    end

    it 'tracks executed queries' 


    it 'only tracks queries triggered from the transaction thread' 

  end

  describe '#subscribe_to_action_view' do
    let(:subscription) { transaction.subscribe_to_action_view }
    let(:time) { Time.now }
    let(:view_data) { { identifier: 'foo.rb' } }

    after do
      ActiveSupport::Notifications.unsubscribe(subscription)
    end

    it 'tracks rendered views' 


    it 'only tracks views rendered from the transaction thread' 

  end
end

