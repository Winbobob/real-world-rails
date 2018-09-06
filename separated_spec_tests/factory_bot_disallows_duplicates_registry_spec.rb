require "spec_helper"

describe FactoryBot::Decorator::DisallowsDuplicatesRegistry do
  let(:registry) { double("registry", name: "Great thing", register: true) }

  subject { described_class.new(registry) }

  it "delegates #register to the registry when not registered" 


  it "raises when attempting to #register a previously registered strategy" 

end

