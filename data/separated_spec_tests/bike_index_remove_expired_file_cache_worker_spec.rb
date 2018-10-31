require 'spec_helper'

describe RemoveExpiredFileCacheWorker do
  it { is_expected.to be_processed_in :carrierwave }

  describe 'perform' do
    it 'removes expired files' 

  end
end

