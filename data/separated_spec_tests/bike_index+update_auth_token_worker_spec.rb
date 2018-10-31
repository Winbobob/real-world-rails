require 'spec_helper'

describe UpdateAuthTokenWorker do
  it { is_expected.to be_processed_in :updates }

  it 'updates the auth token' 

end

