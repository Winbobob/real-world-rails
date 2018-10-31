require 'spec_helper'

describe EmailStolenNotificationWorker do
  it { is_expected.to be_processed_in :notify }

  it 'sends an email' 

end

