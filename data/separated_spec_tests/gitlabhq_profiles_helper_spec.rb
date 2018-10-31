require 'rails_helper'

describe ProfilesHelper do
  describe '#email_provider_label' do
    it "returns nil for users without external email" 


    it "returns omniauth provider label for users with external attributes" 


    it "returns the correct omniauth provider label for users with some external attributes" 


    it "returns 'LDAP' for users with external email but no email provider" 

  end

  def stub_cas_omniauth_provider
    provider = OpenStruct.new(
      'name' => 'cas3',
      'label' => 'CAS'
    )

    stub_omniauth_setting(providers: [provider])
  end
end

