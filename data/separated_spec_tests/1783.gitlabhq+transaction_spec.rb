require 'spec_helper'

describe Gitlab::QueryLimiting::Transaction do
  after do
    Thread.current[described_class::THREAD_KEY] = nil
  end

  describe '.current' do
    it 'returns nil when there is no transaction' 


    it 'returns the transaction when present' 

  end

  describe '.run' do
    it 'runs a transaction and returns it and its return value' 


    it 'removes the transaction from the current thread upon completion' 

  end

  describe '#act_upon_results' do
    context 'when the query threshold is not exceeded' do
      it 'does nothing' 

    end

    context 'when the query threshold is exceeded' do
      let(:transaction) do
        trans = described_class.new
        trans.count = described_class::THRESHOLD + 1

        trans
      end

      it 'raises an error when this is enabled' 

    end
  end

  describe '#increment' do
    it 'increments the number of executed queries' 

  end

  describe '#raise_error?' do
    it 'returns true in a test environment' 


    it 'returns false in a production environment' 

  end

  describe '#threshold_exceeded?' do
    it 'returns false when the threshold is not exceeded' 


    it 'returns true when the threshold is exceeded' 

  end

  describe '#error_message' do
    it 'returns the error message to display when the threshold is exceeded' 


    it 'includes the action name in the error message when present' 

  end
end

