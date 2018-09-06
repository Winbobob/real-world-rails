require 'spec_helper'

describe EmailStolenBikeAlertWorker do
  it { is_expected.to be_processed_in :notify }

  describe 'perform' do
    it 'sends an email' 


    it 'does not send an email if the stolen bike has receive_notifications false' 

  end
end

