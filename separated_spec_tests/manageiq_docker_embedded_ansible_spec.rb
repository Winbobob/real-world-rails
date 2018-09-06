require 'docker'
require_dependency 'embedded_ansible'

describe DockerEmbeddedAnsible do
  before do
    allow(Docker).to receive(:validate_version!).and_return(true)
    allow(MiqEnvironment::Command).to receive(:is_appliance?).and_return(false)
    allow(ContainerOrchestrator).to receive(:available?).and_return(false)
  end

  describe "subject" do
    it "is an instance of DockerEmbeddedAnsible" 

  end

  describe ".available?" do
    it "returns true when the docker gem is usable" 

  end

  describe "#alive?" do
    let(:connection) { double("APIConnection", :api => api) }
    let(:api)        { double("AnsibleAPI") }

    it "returns false if the api raises a JSON::ParserError" 

  end

  describe "#database_host (private)" do
    let(:my_server) { EvmSpecHelper.local_miq_server }
    let(:docker_network_settings) do
      settings = { "IPAM" => {"Config" => [{"Gateway" => "192.0.2.1"}]}}
      double("Docker::Network settings", :info => settings)
    end

    it "returns the active record database host when valid" 


    context "the database config doesn't list a host" do
      before do
        expect(subject).to receive(:database_configuration).and_return("dbname" => "testdatabase")
      end

      it "returns the server ip when set" 


      it "returns the docker bridge gateway address when there is no server ip set" 

    end

    context "the datbase config containes 'host' => 'localhost'" do
      before do
        expect(subject).to receive(:database_configuration).and_return("host" => "localhost")
      end

      it "returns the server ip when set" 


      it "returns the docker bridge gateway address when there is no server ip set" 

    end
  end
end

