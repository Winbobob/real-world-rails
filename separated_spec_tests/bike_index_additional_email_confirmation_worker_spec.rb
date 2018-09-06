require 'spec_helper'

describe AdditionalEmailConfirmationWorker do
  it { is_expected.to be_processed_in :notify }

  it 'sends a confirm your additional email, email' 

end

