require 'spec_helper'

describe LfsFileLockEntity do
  let(:user)     { create(:user) }
  let(:resource) { create(:lfs_file_lock, user: user) }

  let(:request) { double('request', current_user: user) }

  subject { described_class.new(resource, request: request).as_json }

  it 'exposes basic attrs of the lock' 


  it 'exposes the owner info' 

end

