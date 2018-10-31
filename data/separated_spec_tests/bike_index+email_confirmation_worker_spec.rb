require 'spec_helper'

describe EmailConfirmationWorker do
  it { is_expected.to be_processed_in :notify }

  it 'sends a welcome email' 

end

