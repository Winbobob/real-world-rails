describe ContainerOrchestrator do
  let(:connection)      { subject.send(:connection) }
  let(:kube_connection) { subject.send(:kube_connection) }
  let(:cert)            { Tempfile.new("cert") }
  let(:token)           { Tempfile.new("token") }
  let(:cert_path)       { cert.path }
  let(:token_path)      { token.path }
  let(:kube_host)       { "kube.example.com" }
  let(:kube_port)       { "8443" }
  let(:namespace)       { "manageiq" }

  before do
    stub_const("ContainerOrchestrator::CA_CERT_FILE", cert_path)
    stub_const("ContainerOrchestrator::TOKEN_FILE", token_path)
    ENV["KUBERNETES_SERVICE_HOST"] = kube_host
    ENV["KUBERNETES_SERVICE_PORT"] = kube_port
    ENV["MY_POD_NAMESPACE"] = namespace
  end

  after do
    FileUtils.rm_f(cert_path)
    FileUtils.rm_f(token_path)
    ENV.delete("KUBERNETES_SERVICE_HOST")
    ENV.delete("KUBERNETES_SERVICE_PORT")
    ENV.delete("MY_POD_NAMESPACE")
  end

  describe ".available" do
    it "returns false when the required files are not present" 


    it "returns true when the files are present" 

  end

  describe "#connection (private)" do
    it "connects to the correct uri" 

  end

  describe "#kube_connection (private)" do
    it "connects to the correct uri" 

  end

  context "with stub connections" do
    let(:connection_stub)      { double("OpenShiftConnection") }
    let(:kube_connection_stub) { double("KubeConnection") }

    before do
      allow(subject).to receive(:connection).and_return(connection_stub)
      allow(subject).to receive(:kube_connection).and_return(kube_connection_stub)
    end

    describe "#scale" do
      it "patches the deployment config with the specified number of replicas" 

    end

    describe "#create_deployment_config" do
      it "creates a deployment config with the given name and edits" 


      it "doesn't raise an exception for an existing object" 

    end

    describe "#create_service" do
      it "creates a service with the given name, port, and edits" 


      it "doesn't raise an exception for an existing object" 

    end

    describe "#create_secret" do
      it "creates a secret with the given name and data" 


      it "doesn't raise an exception for an existing object" 

    end

    describe "#delete_deployment_config" do
      it "deletes the replication controller if it exists" 


      it "doesn't try to delete the replication controler if it doesn't exist" 

    end
  end
end

