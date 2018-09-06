$LOAD_PATH << Rails.root.join("tools").to_s

require "miqldap_to_sssd"

describe MiqLdapToSssd::AuthConfig do
  describe '#run_auth_config' do
    before do
      @initial_settings = {:mode => "bob", :ldaphost => ["hostname"], :ldapport => 22}
    end

    it 'invokes authconfig with valid parameters' 


    it 'handles authconfig failures' 

  end
end

