$LOAD_PATH << Rails.root.join("tools").to_s

require "miqldap_to_sssd/cli"

describe MiqLdapToSssd::Cli do
  before do
    @all_options = :tls_cacert, :tls_cacertdir, :domain, :only_change_userids, :skip_post_conversion_userid_change
    stub_const("LOGGER", double)
    allow(LOGGER).to receive(:debug)
  end

  describe "#parse" do
    it "should assign defaults" 


    it "should parse base DN domain names" 


    it "should parse bind DN" 


    it "should parse bind pwd" 


    it "should parse TLS cacert path and directory" 


    it "can only updating the userids" 


    it "can skip updating the userids after the conversion" 

  end
end

