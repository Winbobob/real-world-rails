$LOAD_PATH << Rails.root.join("tools", "miqldap_to_sssd").to_s

require "configure_appliance_settings"

describe MiqLdapToSssd::ConfigureApplianceSettings do
  before do
    stub_const("LOGGER", double)
    allow(LOGGER).to receive(:debug)
    @auth_config = {
      :authentication => {:ldaphost   => ["my-ldaphost"],
                          :mode       => "ldap",
                          :httpd_role => false,
                          :ldap_role  => true}
    }
  end

  describe '#configure' do
    let!(:miq_server) { EvmSpecHelper.local_miq_server }
    before do
      stub_local_settings(miq_server)
    end

    it 'upates the authentication settings for external auth' 

  end
end

