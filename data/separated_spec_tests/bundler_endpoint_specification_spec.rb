# frozen_string_literal: true

RSpec.describe Bundler::EndpointSpecification do
  let(:name)         { "foo" }
  let(:version)      { "1.0.0" }
  let(:platform)     { Gem::Platform::RUBY }
  let(:dependencies) { [] }
  let(:metadata)     { nil }

  subject(:spec) { described_class.new(name, version, platform, dependencies, metadata) }

  describe "#build_dependency" do
    let(:name)           { "foo" }
    let(:requirement1)   { "~> 1.1" }
    let(:requirement2)   { ">= 1.1.7" }

    it "should return a Gem::Dependency" 


    context "when an ArgumentError occurs" do
      before do
        allow(Gem::Dependency).to receive(:new).with(name, [requirement1, requirement2]) {
          raise ArgumentError.new("Some error occurred")
        }
      end

      it "should raise the original error" 

    end

    context "when there is an ill formed requirement" do
      before do
        allow(Gem::Dependency).to receive(:new).with(name, [requirement1, requirement2]) {
          raise ArgumentError.new("Ill-formed requirement [\"#<YAML::Syck::DefaultKey")
        }
        # Eliminate extra line break in rspec output due to `puts` in `#build_dependency`
        allow(subject).to receive(:puts) {}
      end

      it "should raise a Bundler::GemspecError with invalid gemspec message" 

    end
  end

  describe "#parse_metadata" do
    context "when the metadata has malformed requirements" do
      let(:metadata) { { "rubygems" => ">\n" } }
      it "raises a helpful error message" 

    end
  end

  it "supports equality comparison" 

end

