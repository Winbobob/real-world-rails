require 'spec_helper'

describe AfterUserChangeWorker do
  it { should be_processed_in :afterwards }

  it 'Calls webhook runner for the user' 

end

