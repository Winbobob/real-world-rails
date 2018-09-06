require 'spec_helper'

describe EmailAdminContactStolenWorker do
  it { is_expected.to be_processed_in :notify }

  describe 'perform' do
    it 'sends an email' 

  end
end

