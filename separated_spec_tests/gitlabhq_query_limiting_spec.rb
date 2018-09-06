require 'spec_helper'

describe Gitlab::QueryLimiting do
  describe '.enable?' do
    it 'returns true in a test environment' 


    it 'returns true in a development environment' 


    it 'returns false on GitLab.com' 


    it 'returns false in a non GitLab.com' 

  end

  describe '.whitelist' do
    it 'raises ArgumentError when an invalid issue URL is given' 


    context 'without a transaction' do
      it 'does nothing' 

    end

    context 'with a transaction' do
      let(:transaction) { Gitlab::QueryLimiting::Transaction.new }

      before do
        allow(Gitlab::QueryLimiting::Transaction)
          .to receive(:current)
          .and_return(transaction)
      end

      it 'does not increment the number of SQL queries executed in the block' 

    end
  end
end

