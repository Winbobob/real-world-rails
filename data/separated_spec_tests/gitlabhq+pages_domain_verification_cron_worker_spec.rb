require 'spec_helper'

describe PagesDomainVerificationCronWorker do
  subject(:worker) { described_class.new }

  describe '#perform' do
    it 'enqueues a PagesDomainVerificationWorker for domains needing verification' 

  end
end

