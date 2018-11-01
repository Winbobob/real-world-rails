require "spec_helper"
require_relative "../../lib/service_registry"

RSpec.describe ServiceRegistry do

  subject(:registry) { described_class }
  let(:service) { double }

  before do
    registry.register(:existing, service)
  end

  describe ".register" do
    it "stores the given service" 

  end

  describe ".service" do
    context "when service is registered" do
      it "returns the service" 

    end

    context "when service is not registered" do
      it "raises ServiceNotRegistered exception" 

    end
  end
end

