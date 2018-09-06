describe MiqCockpit::WS do
  before do
    @server = FactoryGirl.create(:miq_server, :hostname => "hostname")
    @miq_server = EvmSpecHelper.local_miq_server
    @miq_server.ipaddress = "10.0.0.1"
    @miq_server.has_active_userinterface = true
  end

  describe '#url' do
    context "when using empty server" do
      it "it uses direct url" 

    end

    context "when using empty opts" do
      it "it uses defaults with apache" 

    end

    context "when using external_host with path" do
      it "it uses it and preserves the path " 

    end

    context "when using external_host without path" do
      it "it uses it with default path " 

    end

    context "when using the same server as the ui without apache" do
      it "it uses defaults with apache" 

    end

    context "when using the same server as the ui with apache" do
      it "it uses defaults with apache" 

    end

    context "when using custom port with apache" do
      it "it uses https without port" 

    end

    context "when using custom port with the same server without apache" do
      it "it uses the port" 

    end
  end

  describe 'command' do
    context "when using empty opts" do
      it "it uses defaults" 

    end

    context "when using custom port" do
      it "it sets command arguments" 

    end
  end

  describe 'update_config' do
    before do
      @login_command = Rails.root.join("tools", "cockpit", "cockpit-auth-miq")
    end

    context "when using empty opts" do
      it "it uses defaults" 

    end

    context "when using a active region" do
      it "it uses the full domain for the url" 

    end

    context "when options are set" do
      it "it uses them" 

    end
  end
end

describe MiqCockpit::ApacheConfig do
  describe '#url_root ' do
    it "returns the correct URL path" 

  end
end

