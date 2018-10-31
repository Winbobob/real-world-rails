# frozen_string_literal: true

require "bundler/ruby_version"

RSpec.describe "Bundler::RubyVersion and its subclasses" do
  let(:version)              { "2.0.0" }
  let(:patchlevel)           { "645" }
  let(:engine)               { "jruby" }
  let(:engine_version)       { "2.0.1" }

  describe Bundler::RubyVersion do
    subject { Bundler::RubyVersion.new(version, patchlevel, engine, engine_version) }

    let(:ruby_version)         { subject }
    let(:other_version)        { version }
    let(:other_patchlevel)     { patchlevel }
    let(:other_engine)         { engine }
    let(:other_engine_version) { engine_version }
    let(:other_ruby_version)   { Bundler::RubyVersion.new(other_version, other_patchlevel, other_engine, other_engine_version) }

    describe "#initialize" do
      context "no engine is passed" do
        let(:engine) { nil }

        it "should set ruby as the engine" 

      end

      context "no engine_version is passed" do
        let(:engine_version) { nil }

        it "should set engine version as the passed version" 

      end

      context "with engine in symbol" do
        let(:engine) { :jruby }

        it "should coerce engine to string" 

      end

      context "is called with multiple requirements" do
        let(:version) { ["<= 2.0.0", "> 1.9.3"] }
        let(:engine_version) { nil }

        it "sets the versions" 


        it "sets the engine versions" 

      end

      context "is called with multiple engine requirements" do
        let(:engine_version) { [">= 2.0", "< 2.3"] }

        it "sets the engine versions" 

      end
    end

    describe ".from_string" do
      shared_examples_for "returning" do
        it "returns the original RubyVersion" 

      end

      include_examples "returning"

      context "no patchlevel" do
        let(:patchlevel) { nil }

        include_examples "returning"
      end

      context "engine is ruby" do
        let(:engine) { "ruby" }
        let(:engine_version) { version }

        include_examples "returning"
      end

      context "with multiple requirements" do
        let(:engine_version) { ["> 9", "< 11"] }
        let(:version) { ["> 8", "< 10"] }
        let(:patchlevel) { nil }

        it "returns nil" 

      end
    end

    describe "#to_s" do
      it "should return info string with the ruby version, patchlevel, engine, and engine version" 


      context "no patchlevel" do
        let(:patchlevel) { nil }

        it "should return info string with the version, engine, and engine version" 

      end

      context "engine is ruby" do
        let(:engine) { "ruby" }

        it "should return info string with the ruby version and patchlevel" 

      end

      context "with multiple requirements" do
        let(:engine_version) { ["> 9", "< 11"] }
        let(:version) { ["> 8", "< 10"] }
        let(:patchlevel) { nil }

        it "should return info string with all requirements" 

      end
    end

    describe "#==" do
      shared_examples_for "two ruby versions are not equal" do
        it "should return false" 

      end

      context "the versions, pathlevels, engines, and engine_versions match" do
        it "should return true" 

      end

      context "the versions do not match" do
        let(:other_version) { "1.21.6" }

        it_behaves_like "two ruby versions are not equal"
      end

      context "the patchlevels do not match" do
        let(:other_patchlevel) { "21" }

        it_behaves_like "two ruby versions are not equal"
      end

      context "the engines do not match" do
        let(:other_engine) { "ruby" }

        it_behaves_like "two ruby versions are not equal"
      end

      context "the engine versions do not match" do
        let(:other_engine_version) { "1.11.2" }

        it_behaves_like "two ruby versions are not equal"
      end
    end

    describe "#host" do
      before do
        allow(RbConfig::CONFIG).to receive(:[]).with("host_cpu").and_return("x86_64")
        allow(RbConfig::CONFIG).to receive(:[]).with("host_vendor").and_return("apple")
        allow(RbConfig::CONFIG).to receive(:[]).with("host_os").and_return("darwin14.5.0")
      end

      it "should return an info string with the host cpu, vendor, and os" 


      it "memoizes the info string with the host cpu, vendor, and os" 

    end

    describe "#gem_version" do
      let(:gem_version) { "2.0.0" }
      let(:gem_version_obj) { Gem::Version.new(gem_version) }

      shared_examples_for "it parses the version from the requirement string" do |version|
        let(:version) { version }
        it "should return the underlying version" 

      end

      it_behaves_like "it parses the version from the requirement string", "2.0.0"
      it_behaves_like "it parses the version from the requirement string", ">= 2.0.0"
      it_behaves_like "it parses the version from the requirement string", "~> 2.0.0"
      it_behaves_like "it parses the version from the requirement string", "< 2.0.0"
      it_behaves_like "it parses the version from the requirement string", "= 2.0.0"
      it_behaves_like "it parses the version from the requirement string", ["> 2.0.0", "< 2.4.5"]
    end

    describe "#diff" do
      let(:engine) { "ruby" }

      shared_examples_for "there is a difference in the engines" do
        it "should return a tuple with :engine and the two different engines" 

      end

      shared_examples_for "there is a difference in the versions" do
        it "should return a tuple with :version and the two different versions" 

      end

      shared_examples_for "there is a difference in the engine versions" do
        it "should return a tuple with :engine_version and the two different engine versions" 

      end

      shared_examples_for "there is a difference in the patchlevels" do
        it "should return a tuple with :patchlevel and the two different patchlevels" 

      end

      shared_examples_for "there are no differences" do
        it "should return nil" 

      end

      context "all things match exactly" do
        it_behaves_like "there are no differences"
      end

      context "detects engine discrepancies first" do
        let(:other_version)        { "2.0.1" }
        let(:other_patchlevel)     { "643" }
        let(:other_engine)         { "rbx" }
        let(:other_engine_version) { "2.0.0" }

        it_behaves_like "there is a difference in the engines"
      end

      context "detects version discrepancies second" do
        let(:other_version)        { "2.0.1" }
        let(:other_patchlevel)     { "643" }
        let(:other_engine_version) { "2.0.0" }

        it_behaves_like "there is a difference in the versions"
      end

      context "detects version discrepancies with multiple requirements second" do
        let(:other_version)        { "2.0.1" }
        let(:other_patchlevel)     { "643" }
        let(:other_engine_version) { "2.0.0" }

        let(:version) { ["> 2.0.0", "< 1.0.0"] }

        it_behaves_like "there is a difference in the versions"
      end

      context "detects engine version discrepancies third" do
        let(:other_patchlevel)     { "643" }
        let(:other_engine_version) { "2.0.0" }

        it_behaves_like "there is a difference in the engine versions"
      end

      context "detects engine version discrepancies with multiple requirements third" do
        let(:other_patchlevel)     { "643" }
        let(:other_engine_version) { "2.0.0" }

        let(:engine_version) { ["> 2.0.0", "< 1.0.0"] }

        it_behaves_like "there is a difference in the engine versions"
      end

      context "detects patchlevel discrepancies last" do
        let(:other_patchlevel) { "643" }

        it_behaves_like "there is a difference in the patchlevels"
      end

      context "successfully matches gem requirements" do
        let(:version)              { ">= 2.0.0" }
        let(:patchlevel)           { "< 643" }
        let(:engine)               { "ruby" }
        let(:engine_version)       { "~> 2.0.1" }
        let(:other_version)        { "2.0.0" }
        let(:other_patchlevel)     { "642" }
        let(:other_engine)         { "ruby" }
        let(:other_engine_version) { "2.0.5" }

        it_behaves_like "there are no differences"
      end

      context "successfully matches multiple gem requirements" do
        let(:version)              { [">= 2.0.0", "< 2.4.5"] }
        let(:patchlevel)           { "< 643" }
        let(:engine)               { "ruby" }
        let(:engine_version)       { ["~> 2.0.1", "< 2.4.5"] }
        let(:other_version)        { "2.0.0" }
        let(:other_patchlevel)     { "642" }
        let(:other_engine)         { "ruby" }
        let(:other_engine_version) { "2.0.5" }

        it_behaves_like "there are no differences"
      end

      context "successfully detects bad gem requirements with versions with multiple requirements" do
        let(:version)              { ["~> 2.0.0", "< 2.0.5"] }
        let(:patchlevel)           { "< 643" }
        let(:engine)               { "ruby" }
        let(:engine_version)       { "~> 2.0.1" }
        let(:other_version)        { "2.0.5" }
        let(:other_patchlevel)     { "642" }
        let(:other_engine)         { "ruby" }
        let(:other_engine_version) { "2.0.5" }

        it_behaves_like "there is a difference in the versions"
      end

      context "successfully detects bad gem requirements with versions" do
        let(:version)              { "~> 2.0.0" }
        let(:patchlevel)           { "< 643" }
        let(:engine)               { "ruby" }
        let(:engine_version)       { "~> 2.0.1" }
        let(:other_version)        { "2.1.0" }
        let(:other_patchlevel)     { "642" }
        let(:other_engine)         { "ruby" }
        let(:other_engine_version) { "2.0.5" }

        it_behaves_like "there is a difference in the versions"
      end

      context "successfully detects bad gem requirements with patchlevels" do
        let(:version)              { ">= 2.0.0" }
        let(:patchlevel)           { "< 643" }
        let(:engine)               { "ruby" }
        let(:engine_version)       { "~> 2.0.1" }
        let(:other_version)        { "2.0.0" }
        let(:other_patchlevel)     { "645" }
        let(:other_engine)         { "ruby" }
        let(:other_engine_version) { "2.0.5" }

        it_behaves_like "there is a difference in the patchlevels"
      end

      context "successfully detects bad gem requirements with engine versions" do
        let(:version)              { ">= 2.0.0" }
        let(:patchlevel)           { "< 643" }
        let(:engine)               { "ruby" }
        let(:engine_version)       { "~> 2.0.1" }
        let(:other_version)        { "2.0.0" }
        let(:other_patchlevel)     { "642" }
        let(:other_engine)         { "ruby" }
        let(:other_engine_version) { "2.1.0" }

        it_behaves_like "there is a difference in the engine versions"
      end

      context "with a patchlevel of -1" do
        let(:version)              { ">= 2.0.0" }
        let(:patchlevel)           { "-1" }
        let(:engine)               { "ruby" }
        let(:engine_version)       { "~> 2.0.1" }
        let(:other_version)        { version }
        let(:other_engine)         { engine }
        let(:other_engine_version) { engine_version }

        context "and comparing with another patchlevel of -1" do
          let(:other_patchlevel) { patchlevel }

          it_behaves_like "there are no differences"
        end

        context "and comparing with a patchlevel that is not -1" do
          let(:other_patchlevel)     { "642" }

          it_behaves_like "there is a difference in the patchlevels"
        end
      end
    end

    describe "#system" do
      subject { Bundler::RubyVersion.system }

      let(:bundler_system_ruby_version) { subject }

      before do
        Bundler::RubyVersion.instance_variable_set("@ruby_version", nil)
      end

      it "should return an instance of Bundler::RubyVersion" 


      it "memoizes the instance of Bundler::RubyVersion" 


      describe "#version" do
        it "should return a copy of the value of RUBY_VERSION" 

      end

      describe "#engine" do
        context "RUBY_ENGINE is defined" do
          before { stub_const("RUBY_ENGINE", "jruby") }
          before { stub_const("JRUBY_VERSION", "2.1.1") }

          it "should return a copy of the value of RUBY_ENGINE" 

        end

        context "RUBY_ENGINE is not defined" do
          before { stub_const("RUBY_ENGINE", nil) }

          it "should return the string 'ruby'" 

        end
      end

      describe "#engine_version" do
        context "engine is ruby" do
          before do
            stub_const("RUBY_VERSION", "2.2.4")
            stub_const("RUBY_ENGINE", "ruby")
          end

          it "should return a copy of the value of RUBY_VERSION" 

        end

        context "engine is rbx" do
          before do
            stub_const("RUBY_ENGINE", "rbx")
            stub_const("Rubinius::VERSION", "2.0.0")
          end

          it "should return a copy of the value of Rubinius::VERSION" 

        end

        context "engine is jruby" do
          before do
            stub_const("RUBY_ENGINE", "jruby")
            stub_const("JRUBY_VERSION", "2.1.1")
          end

          it "should return a copy of the value of JRUBY_VERSION" 

        end

        context "engine is some other ruby engine" do
          before do
            stub_const("RUBY_ENGINE", "not_supported_ruby_engine")
            stub_const("RUBY_ENGINE_VERSION", "1.2.3")
          end

          it "returns RUBY_ENGINE_VERSION" 

        end
      end

      describe "#patchlevel" do
        it "should return a string with the value of RUBY_PATCHLEVEL" 

      end
    end

    describe "#to_gem_version_with_patchlevel" do
      shared_examples_for "the patchlevel is omitted" do
        it "does not include a patch level" 

      end

      context "with nil patch number" do
        let(:patchlevel) { nil }

        it_behaves_like "the patchlevel is omitted"
      end

      context "with negative patch number" do
        let(:patchlevel) { -1 }

        it_behaves_like "the patchlevel is omitted"
      end

      context "with a valid patch number" do
        it "uses the specified patchlevel as patchlevel" 

      end
    end
  end
end

