require "spec_helper"
require "rspec/support/warnings"
require 'rspec/support/spec/shell_out'

describe "rspec warnings and deprecations" do
  include RSpec::Support::ShellOut
  let(:warning_object) do
    Object.new.tap { |o| o.extend(RSpec::Support::Warnings) }
  end

  it 'works when required in isolation' 


  context "when rspec-core is not available" do
    shared_examples "falling back to Kernel.warn" do |args|
      let(:method_name) { args.fetch(:method_name) }

      it 'falls back to warning with a plain message' 


      it "handles being passed options" 

    end

    it_behaves_like 'falling back to Kernel.warn', :method_name => :deprecate
    it_behaves_like 'falling back to Kernel.warn', :method_name => :warn_deprecation
  end

  shared_examples "warning helper" do |helper|
    it 'warns with the message text' 


    it 'sets the calling line' 


    it 'optionally sets the replacement' 

  end

  describe "#warning" do
    it 'prepends WARNING:' 


    it_should_behave_like 'warning helper', :warning
  end

  describe "#warn_with message, options" do
    it_should_behave_like 'warning helper', :warn_with
  end
end

