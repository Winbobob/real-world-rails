require 'rails_helper'

RSpec.describe BlockDomainFromAccountService, type: :service do
  let!(:wolf) { Fabricate(:account, username: 'wolf', domain: 'evil.org') }
  let!(:alice) { Fabricate(:account, username: 'alice') }

  subject { BlockDomainFromAccountService.new }

  it 'creates domain block' 


  it 'purge followers from blocked domain' 

end

