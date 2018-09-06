require 'spec_helper'

describe PagesDomainVerificationWorker do
  subject(:worker) { described_class.new }

  let(:domain) { create(:pages_domain) }

  describe '#perform' do
    it 'does nothing for a non-existent domain' 


    it 'delegates to VerifyPagesDomainService' 

  end
end

