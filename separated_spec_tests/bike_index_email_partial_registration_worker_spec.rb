require 'spec_helper'

describe EmailPartialRegistrationWorker do
  it { is_expected.to be_processed_in :notify }

  it 'sends a partial registration email' 

end

