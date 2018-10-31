require 'spec_helper'

describe Gitlab::QueryLimiting::ActiveSupportSubscriber do
  let(:transaction) { instance_double(Gitlab::QueryLimiting::Transaction, increment: true) }

  before do
    allow(Gitlab::QueryLimiting::Transaction)
      .to receive(:current)
      .and_return(transaction)
  end

  describe '#sql' do
    it 'increments the number of executed SQL queries' 


    context 'when the query is actually a rails cache hit' do
      it 'does not increment the number of executed SQL queries' 

    end
  end
end

