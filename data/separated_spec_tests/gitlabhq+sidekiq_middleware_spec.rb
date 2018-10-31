require 'spec_helper'

describe Gitlab::Metrics::SidekiqMiddleware do
  let(:middleware) { described_class.new }
  let(:message) { { 'args' => ['test'], 'enqueued_at' => Time.new(2016, 6, 23, 6, 59).to_f } }

  describe '#call' do
    it 'tracks the transaction' 


    it 'tracks the transaction (for messages without `enqueued_at`)' 


    it 'tracks any raised exceptions' 

  end
end

