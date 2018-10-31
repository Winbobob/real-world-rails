$LOAD_PATH << Rails.root.join("tools").to_s

require "miqldap_to_sssd"

describe MiqLdapToSssd::MiqLdapConfiguration do
  describe '#retrieve_initial_settings' do
    let(:settings) { {:tls_cacert => 'cert', :domain => "example.com"} }

    it 'raises an error when the basedn domain can not be determined' 


    it 'when mode is ldap and bind dn is nil raises an error' 


    it 'when mode is ldaps and bind dn is nil does not raises an error' 


    it 'when mode is ldap and bind pwd is nil raises an error' 


    it 'when mode is ldaps and bind pwd is nil does not raises an error' 


    it 'does not modify domain if provided' 


    it 'sets domain from mixed case basedn' 

  end
end

