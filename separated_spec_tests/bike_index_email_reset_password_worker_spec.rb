require 'spec_helper'

describe EmailResetPasswordWorker do
  it { is_expected.to be_processed_in :notify }

  it 'sends a password_reset email' 

end

