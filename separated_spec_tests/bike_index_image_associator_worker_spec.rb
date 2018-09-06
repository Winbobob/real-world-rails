require 'spec_helper'

describe ImageAssociatorWorker do
  it { is_expected.to be_processed_in :updates }

  it 'enqueues another awesome job' 

end

