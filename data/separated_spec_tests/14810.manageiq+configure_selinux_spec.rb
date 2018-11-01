$LOAD_PATH << Rails.root.join("tools").to_s

require "miqldap_to_sssd"

describe MiqLdapToSssd::ConfigureSELinux do
  describe '#configure' do
    before do
      @initial_settings = {:ldapport => '22'}
    end

    it 'invokes semanage and setsebool with valid parameters' 


    it 'handles semanage already defined result' 


    it 'handles semanage failures' 


    it 'handles setsebool failures' 

  end
end

