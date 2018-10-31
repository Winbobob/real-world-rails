require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20180220150310_remove_empty_extern_uid_auth0_identities.rb')

describe RemoveEmptyExternUidAuth0Identities, :migration do
  let(:identities) { table(:identities) }

  before do
    identities.create(provider: 'auth0', extern_uid: '')
    identities.create(provider: 'auth0', extern_uid: 'valid')
    identities.create(provider: 'github', extern_uid: '')

    migrate!
  end

  it 'leaves the correct auth0 identity' 


  it 'leaves the correct github identity' 

end

