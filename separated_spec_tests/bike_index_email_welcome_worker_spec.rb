require 'spec_helper'

describe EmailWelcomeWorker do
  it { is_expected.to be_processed_in :notify }

  it 'enqueues listing ordering job' 

end

