require 'rails_helper'

describe API::Entities::CaseWorker do
  let(:case_worker) { instance_double(CaseWorker, id: 1, uuid: 'uuid', first_name: 'Kaia', last_name: 'Casper', email: 'test123@example.com') }

  it 'represents the case_worker entity' 

end

