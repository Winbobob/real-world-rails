$LOAD_PATH << Rails.root.join("tools").to_s

require "miqldap_to_sssd"
require "tempfile"
require "fileutils"

describe MiqLdapToSssd::ConfigureApache do
  before do
    @spec_name = File.basename(__FILE__).split(".rb").first.freeze
  end

  describe '#onfigure' do
    let(:manageiq_pam_conf) do
      <<-PAM_CONF.strip_heredoc
        manageiq pam conf data
      PAM_CONF
    end

    let(:manageiq_remote_user_conf) do
      <<-REMOTE_USER_CONF.strip_heredoc
        manageiq remote user conf data
      REMOTE_USER_CONF
    end

    let(:manageiq_external_auth_conf) do
      <<-EXTERNAL_AUTH_KERB_CONF.strip_heredoc
        KrbMethodK5Passwd  Off
        KrbAuthRealms      <%= realm %>
        Krb5KeyTab         /etc/http.keytab
      EXTERNAL_AUTH_KERB_CONF
    end

    let(:expected_manageiq_external_auth_conf) do
      <<-EXPECTED_EXTERNAL_AUTH_KERB_CONF.strip_heredoc
        KrbMethodK5Passwd  Off
        KrbAuthRealms      bob.your.uncle.com
        Krb5KeyTab         /etc/http.keytab
      EXPECTED_EXTERNAL_AUTH_KERB_CONF
    end

    let(:manageiq_external_auth_gssapi_conf) do
      <<-EXTERNAL_AUTH_GSSAPI_CONF.strip_heredoc
        AuthType           GSSAPI
        AuthName           "GSSAPI Single Sign On Login"
        GssapiCredStore    keytab:/etc/http.keytab
        GssapiLocalName    on
      EXTERNAL_AUTH_GSSAPI_CONF
    end

    before do
      @initial_settings = {:domain => "bob.your.uncle.com"}

      @test_dir = "#{Dir.tmpdir}/#{@spec_name}"
      @template_dir = "#{@test_dir}/TEMPLATE"
      stub_const("MiqLdapToSssd::ConfigureApache::TEMPLATE_DIR", @template_dir)

      @httpd_conf_dir = "#{@test_dir}/etc/httpd/conf.d"
      FileUtils.mkdir_p @httpd_conf_dir
      @httpd_template_dir = FileUtils.mkdir_p("#{@template_dir}/#{@httpd_conf_dir}")[0]
      stub_const("MiqLdapToSssd::ConfigureApache::HTTPD_CONF_DIR", @httpd_conf_dir)

      @pam_conf_dir = "#{@test_dir}/etc/pam.d"
      FileUtils.mkdir_p @pam_conf_dir
      @pam_template_dir = FileUtils.mkdir_p("#{@template_dir}/#{@pam_conf_dir}")[0]
      stub_const("MiqLdapToSssd::ConfigureApache::PAM_CONF_DIR", @pam_conf_dir)

      File.open("#{@pam_template_dir}/httpd-auth", "w") { |f| f.write(manageiq_pam_conf) }
      File.open("#{@httpd_template_dir}/manageiq-remote-user.conf", "w") { |f| f.write(manageiq_remote_user_conf) }
      File.open("#{@httpd_template_dir}/manageiq-external-auth.conf.erb", "w") do |f|
        f.write(manageiq_external_auth_conf)
      end
    end

    after do
      FileUtils.rm_rf(@test_dir)
    end

    it 'creates the httpd and pam config files' 


    it 'silently ignores missing KrbAuthRealms when creating the gssapi httpd config file' 


    it 'raises an error when a TEMPLATE file is missing' 

  end
end

