require 'spec_helper'

describe Gitlab::JobWaiter do
  describe '.notify' do
    it 'pushes the jid to the named queue' 

  end

  describe '#wait' do
    let(:waiter) { described_class.new(2) }

    it 'returns when all jobs have been completed' 


    it 'times out if not all jobs complete' 

  end
end

