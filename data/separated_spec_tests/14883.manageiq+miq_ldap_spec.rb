# encoding: US-ASCII

describe MiqLdap do
  before do
    @host     = 'mycompany.com'

    # TODO: Use an actual user so this test actually tests something in the CI server
    @userid   = nil   # Please change locally in your test (e.g. randomuser@mycompany.com)
    @password = nil   # Please change locally in your test

    @auth = {
      :bind_dn  => @userid,
      :bind_pwd => @password,
      :ldapport => 389,
      :ldaphost => @host
    }

    @options = {
      :mode             => 'ldap',
      :basedn           => 'dc=mycompany,dc=com',
      :follow_referrals => true,
      :user_type        => 'userprincipalname',
      :user_suffix      => 'mycompany.com',
      :auth             => @auth
    }
  end

  it "binds with proper credentials" 


  let(:users) { %w(rock@mycompany.com smith@mycompany.com will@mycompany.com john@mycompany.com) }

  it "gets user information" 


  it "follows referrals" 


  it "gets the correct memberships calling get_memberships with and without depth" 


  it "uses the correct IP Address when multiple hosts are passed" 


  it "#sid_to_s" 


  context 'when a hostname is available' do
    before do
      allow(TCPSocket).to receive(:gethostbyname).and_return(["testhostname", "aliases", "type", "192.168.252.20"])
      allow(TCPSocket).to receive(:new)
    end

    it 'when mode is ldaps returns a hostname and does not set verify_mode' 


    it 'when mode is ldap returns a hostname and does not set encryption options' 

  end

  context 'when only an IPAddress is available' do
    before do
      expect(TCPSocket).not_to receive(:gethostbyname)
      allow(TCPSocket).to receive(:new)
    end

    it 'when mode is ldaps returns an IPAddress and disables verify_mode' 


    it 'when mode is ldap returns an IPAddress and does not set encryption options' 

  end

  context '#get_user_object' do
    before do
      allow(TCPSocket).to receive(:new)
      @opts = {:base => nil, :scope => :sub, :filter => "(userprincipalname=myuserid@mycompany.com)"}
    end

    it "searches for group memberships with the specified group attribute" 


    it "searches for group memberships with the default group attribute" 


    it "searches for group membership when username is upn regardless of user_type" 

  end

  context "#fqusername" do
    before do
      allow(TCPSocket).to receive(:new)
      @opts = {:host => ["192.0.2.2"], :user_suffix => 'mycompany.com', :domain_prefix => 'my\domain'}
    end

    it "returns username when username is already a dn" 


    it "returns username when username is a dn with an @ in the dn" 


    it "returns a constructed dn when user type is a dn" 


    it "returns username when username is already a upn" 


    it "returns username when username is already a domain username" 


    it "returns username when username is already a upn even if user_type is samaccountname" 


    it "returns upn when user_type is upn" 


    it "returns samaccountname when user_type is samaccountname" 


    it "searches for username when user_type is mail even when username is UPN" 

  end
end

