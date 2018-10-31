require 'spec_helper'

describe InvalidGpgSignatureUpdateWorker do
  context 'when GpgKey is found' do
    it 'calls NotificationService.new.run' 

  end

  context 'when GpgKey is not found' do
    let(:nonexisting_gpg_key_id) { -1 }

    it 'does not raise errors' 


    it 'does not call NotificationService.new.run' 

  end
end

