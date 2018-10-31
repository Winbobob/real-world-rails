require 'rails_helper'

describe SyncSalesAccount do
  before { Timecop.freeze }
  after { Timecop.return }

  it 'sends the serialized account data to salesmachine via a client' 

end

