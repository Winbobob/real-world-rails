require 'spec_helper'

describe ListicleImageSizeWorker do
  it { is_expected.to be_processed_in :carrierwave }

  it 'enqueues another awesome job' 

end

