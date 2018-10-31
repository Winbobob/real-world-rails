require 'spec_helper'

describe EmailNoAdminsNotificationWorker do
  it { is_expected.to be_processed_in :notify }

  it 'sends an email' 

end

