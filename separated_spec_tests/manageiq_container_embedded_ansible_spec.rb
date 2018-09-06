require 'docker'
require_dependency 'embedded_ansible'

describe ContainerEmbeddedAnsible do
  let(:miq_database) { MiqDatabase.first }
  let(:orchestrator) { double("ContainerOrchestrator") }

  before do
    allow(ContainerOrchestrator).to receive(:available?).and_return(true)
    allow(MiqEnvironment::Command).to receive(:is_appliance?).and_return(false)
    allow(Docker).to receive(:validate_version!).and_raise(RuntimeError)
    allow(ContainerOrchestrator).to receive(:new).and_return(orchestrator)

    FactoryGirl.create(:miq_region, :region => ApplicationRecord.my_region_number)
    MiqDatabase.seed
    EvmSpecHelper.create_guid_miq_server_zone
  end

  describe "subject" do
    it "is an instance of ContainerEmbeddedAnsible" 

  end

  describe ".available" do
    it "returns true" 

  end

  describe "#start" do
    it "waits for the service to respond" 

  end

  describe "#stop" do
    it "removes all the previously created objects" 

  end

  describe "#api_connection" do
    it "connects to the ansible service" 

  end

  describe "#create_ansible_secret (private)" do
    it "uses the existing values in our database" 

  end

  describe "#container_environment (private)" do
    let!(:db_user)     { miq_database.set_ansible_database_authentication(:password => "dbpassword").userid }
    let!(:rabbit_user) { miq_database.set_ansible_rabbitmq_authentication(:password => "rabbitpass").userid }

    around do |example|
      ENV["POSTGRESQL_SERVICE_HOST"] = "postgres.example.com"
      example.run
      ENV.delete("POSTGRESQL_SERVICE_HOST")
    end

    it "sends RABBITMQ_USER_NAME value from the database" 


    it "sends DATABASE_SERVICE_NAME value from the PG service host" 


    it "sends POSTGRESQL_USER value from the database" 

  end
end

