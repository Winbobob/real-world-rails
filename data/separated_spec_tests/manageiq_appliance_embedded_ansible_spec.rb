require 'linux_admin'
require 'docker'
require_dependency 'embedded_ansible'

describe ApplianceEmbeddedAnsible do
  before do
    allow(MiqEnvironment::Command).to receive(:is_appliance?).and_return(true)
    allow(ContainerOrchestrator).to receive(:available?).and_return(false)
    allow(Docker).to receive(:validate_version!).and_raise(RuntimeError)

    installed_rpms = {
      "ansible-tower-server" => "1.0.1",
      "ansible-tower-setup"  => "1.2.3",
      "vim"                  => "13.5.1"
    }
    allow(LinuxAdmin::Rpm).to receive(:list_installed).and_return(installed_rpms)
  end

  describe "subject" do
    it "is an instance of ApplianceEmbeddedAnsible" 

  end

  describe ".available?" do
    it "returns true with the tower rpms installed" 

  end

  context "with services" do
    let(:nginx_service)       { double("nginx service") }
    let(:supervisord_service) { double("supervisord service") }
    let(:rabbitmq_service)    { double("rabbitmq service") }

    before do
      expect(AwesomeSpawn).to receive(:run!)
        .with("source /etc/sysconfig/ansible-tower; echo $TOWER_SERVICES")
        .and_return(double(:output => "nginx supervisord rabbitmq"))
      allow(LinuxAdmin::Service).to receive(:new).with("nginx").and_return(nginx_service)
      allow(LinuxAdmin::Service).to receive(:new).with("supervisord").and_return(supervisord_service)
      allow(LinuxAdmin::Service).to receive(:new).with("rabbitmq").and_return(rabbitmq_service)
    end

    describe "#running?" do
      it "returns true when all services are running" 


      it "returns false when a service is not running" 

    end

    describe ".stop" do
      it "stops all the services" 

    end

    describe ".disable" do
      it "stops and disables all the services" 

    end

    describe "#start when configured and not upgrading" do
      let(:version_file) { Tempfile.new("tower_version") }

      before do
        version_file.write("3.1.3\n")
        version_file.close
        stub_const("ApplianceEmbeddedAnsible::TOWER_VERSION_FILE", version_file.path)
        expect(LinuxAdmin::Rpm).to receive(:info).with("ansible-tower-server").and_return("version" => "3.1.3")

        stub_const("EmbeddedAnsible::WAIT_FOR_ANSIBLE_SLEEP", 0)

        expect(subject).to receive(:configured?).and_return true

        expect(nginx_service).to receive(:start).and_return(nginx_service)
        expect(supervisord_service).to receive(:start).and_return(supervisord_service)
        expect(rabbitmq_service).to receive(:start).and_return(rabbitmq_service)

        expect(nginx_service).to receive(:enable).and_return(nginx_service)
        expect(supervisord_service).to receive(:enable).and_return(supervisord_service)
        expect(rabbitmq_service).to receive(:enable).and_return(rabbitmq_service)
        expect(subject).to receive(:update_proxy_settings)
      end

      it "waits for Ansible to respond" 


      it "raises if Ansible doesn't respond" 

    end
  end

  context "with an miq_databases row" do
    let(:miq_database) { MiqDatabase.first }
    let(:extra_vars) do
      {
        :awx_install_memcached_bind => MiqMemcached.server_address,
        :minimum_var_space          => 0,
        :http_port                  => described_class::HTTP_PORT,
        :https_port                 => described_class::HTTPS_PORT,
        :tower_package_name         => "ansible-tower-server"
      }.to_json
    end

    before do
      FactoryGirl.create(:miq_region, :region => ApplicationRecord.my_region_number)
      MiqDatabase.seed
      EvmSpecHelper.create_guid_miq_server_zone
    end

    context "with a key file" do
      let(:key_file)      { Tempfile.new("SECRET_KEY") }
      let(:complete_file) { Tempfile.new("embedded_ansible_setup_complete") }

      before do
        stub_const("ApplianceEmbeddedAnsible::SECRET_KEY_FILE", key_file.path)
        allow(subject).to receive(:setup_complete_file).and_return(complete_file.path)
      end

      after do
        key_file.unlink
      end

      describe "#configured?" do
        it "returns true when the key in the file is the same as the one in the database" 


        it "returns false when the key is configured but the complete file is missing" 


        it "returns false when there is no key in the database" 


        it "returns false when the key in the file doesn't match the one in the database" 


        it "returns false when the file doesn't exist and there is a value in the database" 

      end

      describe "#configure_secret_key (private)" do
        it "sets a new key when there is no key in the database" 


        it "writes the key when a key is in the database" 

      end
    end

    describe "#start when configured and upgrading" do
      let(:version_file) { Tempfile.new("tower_version") }

      before do
        version_file.write("3.1.2\n")
        version_file.close
        stub_const("ApplianceEmbeddedAnsible::TOWER_VERSION_FILE", version_file.path)
        expect(LinuxAdmin::Rpm).to receive(:info).with("ansible-tower-server").and_return("version" => "3.1.3")

        expect(subject).to receive(:configured?).and_return(true)
        expect(subject).to receive(:configure_secret_key)
      end

      it "runs the setup playbook" 

    end

    describe "#start when not configured" do
      before do
        expect(subject).to receive(:configured?).and_return(false)
        expect(subject).to receive(:configure_secret_key)
      end

      it "generates new passwords with no passwords set" 


      it "uses the existing passwords when they are set in the database" 


      it "removes the secret key from the database when setup fails" 

    end
  end

  describe "#update_proxy_settings (private)" do
    let(:file_content) do
      <<-EOF
# Arbitrary line 1

# Arbitrary line 2
AWX_TASK_ENV['HTTP_PROXY'] = 'somehost'
AWX_TASK_ENV['HTTPS_PROXY'] = 'somehost'
AWX_TASK_ENV['NO_PROXY'] = 'somehost'
EOF
    end
    let(:proxy_uri) { "http://user:password@localhost:3333" }
    let(:settings_file) { Tempfile.new("settings.py") }
    before do
      settings_file.write(file_content)
      settings_file.close
      stub_const("ApplianceEmbeddedAnsible::SETTINGS_FILE", settings_file.path)
      expect(VMDB::Util).to receive(:http_proxy_uri).and_return(proxy_uri)
    end

    it "add current proxy info" 

  end
end

