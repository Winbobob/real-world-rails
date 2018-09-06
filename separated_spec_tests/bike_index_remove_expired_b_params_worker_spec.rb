require 'spec_helper'

describe RemoveExpiredBParamsWorker do
  it { is_expected.to be_processed_in :afterwards }

  it "doesn't fail if b_param doesn't exist" 


  it 'removes old b_params' 


  it "doesn't delete b_params with existing bikes created today" 

end

