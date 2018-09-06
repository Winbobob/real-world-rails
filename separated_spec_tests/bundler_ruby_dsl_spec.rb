# frozen_string_literal: true

require "bundler/ruby_dsl"

RSpec.describe Bundler::RubyDsl do
  class MockDSL
    include Bundler::RubyDsl

    attr_reader :ruby_version
  end

  let(:dsl) { MockDSL.new }
  let(:ruby_version) { "2.0.0" }
  let(:version) { "2.0.0" }
  let(:engine) { "jruby" }
  let(:engine_version) { "9000" }
  let(:patchlevel) { "100" }
  let(:options) do
    { :patchlevel => patchlevel,
      :engine => engine,
      :engine_version => engine_version }
  end

  let(:invoke) do
    proc do
      args = Array(ruby_version) + [options]
      dsl.ruby(*args)
    end
  end

  subject do
    invoke.call
    dsl.ruby_version
  end

  describe "#ruby_version" do
    shared_examples_for "it stores the ruby version" do
      it "stores the version" 


      it "stores the engine details" 


      it "stores the patchlevel" 

    end

    context "with a plain version" do
      it_behaves_like "it stores the ruby version"
    end

    context "with a single requirement" do
      let(:ruby_version) { ">= 2.0.0" }
      it_behaves_like "it stores the ruby version"
    end

    context "with two requirements in the same string" do
      let(:ruby_version) { ">= 2.0.0, < 3.0" }
      it "raises an error" 

    end

    context "with two requirements" do
      let(:ruby_version) { ["~> 2.0.0", "> 2.0.1"] }
      it_behaves_like "it stores the ruby version"
    end

    context "with multiple engine versions" do
      let(:engine_version) { ["> 200", "< 300"] }
      it_behaves_like "it stores the ruby version"
    end

    context "with no options hash" do
      let(:invoke) { proc { dsl.ruby(ruby_version) } }

      let(:patchlevel) { nil }
      let(:engine) { "ruby" }
      let(:engine_version) { version }

      it_behaves_like "it stores the ruby version"

      context "and with multiple requirements" do
        let(:ruby_version) { ["~> 2.0.0", "> 2.0.1"] }
        let(:engine_version) { ruby_version }
        it_behaves_like "it stores the ruby version"
      end
    end
  end
end

