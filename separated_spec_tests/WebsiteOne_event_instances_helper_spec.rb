require 'spec_helper'

describe EventInstancesHelper, type: :helper do
  let(:uuid) { '82c2b3b8-42f7-442b-be64-86c2f407b2ed' }

  before do
    expect(SecureRandom).to receive(:uuid).and_return(uuid)
  end

  it 'generates a unique id for a hangout event' 


  it 'generates an id if project is nil' 

end

