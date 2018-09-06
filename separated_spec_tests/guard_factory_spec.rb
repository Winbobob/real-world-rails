require "guard/compat/test/helper"

require "guard/rspec/inspectors/factory"

RSpec.describe Guard::RSpec::Inspectors::Factory do
  let(:factory) { Guard::RSpec::Inspectors::Factory }
  let(:options) { {} }

  it "can not be instantiated" 


  context "with :focus failed mode and custom options" do
    let(:options) { { failed_mode: :focus, custom: "value" } }

    it "creates FocusedInspector instance with custom options" 

  end

  context "with :keep failed mode and custom options" do
    let(:options) { { failed_mode: :keep, custom: "value" } }

    it "creates KeepingInspector instance with custom options" 

  end

  context "with :none failed mode and custom options" do
    let(:options) { { failed_mode: :none, custom: "value" } }

    it "creates SimpleInspector instance with custom options" 

  end
end

