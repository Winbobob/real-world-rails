# frozen_string_literal: true

RSpec.describe Bundler::Plugin::API do
  context "plugin declarations" do
    before do
      stub_const "UserPluginClass", Class.new(Bundler::Plugin::API)
    end

    describe "#command" do
      it "declares a command plugin with same class as handler" 


      it "accepts another class as argument that handles the command" 

    end

    describe "#source" do
      it "declares a source plugin with same class as handler" 


      it "accepts another class as argument that handles the command" 

    end

    describe "#hook" do
      it "accepts a block and passes it to Plugin module" 

    end
  end

  context "bundler interfaces provided" do
    before do
      stub_const "UserPluginClass", Class.new(Bundler::Plugin::API)
    end

    subject(:api) { UserPluginClass.new }

    # A test of delegation
    it "provides the Bundler's functions" 


    it "includes Bundler::SharedHelpers' functions" 


    context "#tmp" do
      it "provides a tmp dir" 


      it "accepts multiple names for suffix" 

    end
  end
end

