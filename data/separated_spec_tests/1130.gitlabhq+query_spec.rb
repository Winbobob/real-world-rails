require 'spec_helper'

describe Gitlab::Sherlock::Query do
  let(:started_at)  { Time.utc(2015, 1, 1) }
  let(:finished_at) { started_at + 5 }

  let(:query) do
    described_class.new('SELECT COUNT(*) FROM users', started_at, finished_at)
  end

  describe 'new_with_bindings' do
    it 'returns a Query' 

  end

  describe '#id' do
    it 'returns a String' 

  end

  describe '#query' do
    it 'returns the query with a trailing semi-colon' 

  end

  describe '#started_at' do
    it 'returns the start time' 

  end

  describe '#finished_at' do
    it 'returns the completion time' 

  end

  describe '#backtrace' do
    it 'returns the backtrace' 

  end

  describe '#duration' do
    it 'returns the duration in milliseconds' 

  end

  describe '#to_param' do
    it 'returns the query ID' 

  end

  describe '#formatted_query' do
    it 'returns a formatted version of the query' 

  end

  describe '#last_application_frame' do
    it 'returns the last application frame' 

  end

  describe '#application_backtrace' do
    it 'returns an Array of application frames' 

  end

  describe '#explain' do
    it 'returns the query plan as a String' 

  end
end

