require 'spec_helper'

describe RspecApiDocumentation::ApiFormatter do
  let(:metadata) { {} }
  let(:group) { RSpec::Core::ExampleGroup.describe("Orders", metadata) }
  let(:output) { StringIO.new }
  let(:formatter) { RspecApiDocumentation::ApiFormatter.new(output) }

  describe "generating documentation" do
    include FakeFS::SpecHelpers

    before do
      RspecApiDocumentation.documentations.each do |configuration|
        allow(configuration).to receive(:clear_docs)
        allow(configuration).to receive(:document_example)
        allow(configuration).to receive(:write)
      end
    end

    it "should clear all docs on start" 


    it "should document passing examples" 


    it "should write the docs on stop" 

  end

  describe "output" do
    let(:reporter) { RSpec::Core::Reporter.new(RSpec::Core::Configuration.new) }

    before do
      # don't do any work
      allow(RspecApiDocumentation).to receive(:documentations).and_return([])

      reporter.register_listener formatter, :start, :example_group_started, :example_passed, :example_failed, :stop
    end

    context "with passing examples" do
      before do
        group.example("Ordering a cup of coffee") {}
        group.example("Updating an order") {}
        group.example("Viewing an order") {}
      end

      it "should list the generated docs" 

    end

    context "with failing examples" do
      before do
        group.example("Ordering a cup of coffee") {}
        group.example("Updating an order") { expect(true).to eq(false) }
        group.example("Viewing an order") { expect(true).to eq(false) }
      end

      it "should indicate failures" 

    end
  end
end

