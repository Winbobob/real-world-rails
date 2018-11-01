require 'spec_helper'

describe EmailOwnershipInvitationWorker do
  it { is_expected.to be_processed_in :notify }

  it 'sends an email' 


  it 'does not send an email if the ownership does not exist' 

end

