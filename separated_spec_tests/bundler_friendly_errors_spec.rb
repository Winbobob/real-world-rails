# frozen_string_literal: true

require "bundler"
require "bundler/friendly_errors"
require "cgi"

RSpec.describe Bundler, "friendly errors" do
  context "with invalid YAML in .gemrc" do
    before do
      File.open(Gem.configuration.config_file_name, "w") do |f|
        f.write "invalid: yaml: hah"
      end
    end

    after do
      FileUtils.rm(Gem.configuration.config_file_name)
    end

    it "reports a relevant friendly error message", :ruby => ">= 1.9", :rubygems => "< 2.5.0" 


    it "reports a relevant friendly error message", :ruby => ">= 1.9", :rubygems => ">= 2.5.0" 

  end

  it "calls log_error in case of exception" 


  it "calls exit_status on exception" 


  describe "#log_error" do
    shared_examples "Bundler.ui receive error" do |error, message|
      it "" 

    end

    shared_examples "Bundler.ui receive trace" do |error|
      it "" 

    end

    context "YamlSyntaxError" do
      it_behaves_like "Bundler.ui receive error", Bundler::YamlSyntaxError.new(StandardError.new, "sample_message")

      it "Bundler.ui receive trace" 

    end

    context "Dsl::DSLError, GemspecError" do
      it_behaves_like "Bundler.ui receive error", Bundler::Dsl::DSLError.new("description", "dsl_path", "backtrace")
      it_behaves_like "Bundler.ui receive error", Bundler::GemspecError.new
    end

    context "GemRequireError" do
      let(:orig_error) { StandardError.new }
      let(:error) { Bundler::GemRequireError.new(orig_error, "sample_message") }

      before do
        allow(orig_error).to receive(:backtrace).and_return([])
      end

      it "Bundler.ui receive error" 


      it "writes to Bundler.ui.trace" 

    end

    context "BundlerError" do
      it "Bundler.ui receive error" 

      it_behaves_like "Bundler.ui receive trace", Bundler::BundlerError.new
    end

    context "Thor::Error" do
      it_behaves_like "Bundler.ui receive error", Bundler::Thor::Error.new
    end

    context "LoadError" do
      let(:error) { LoadError.new("cannot load such file -- openssl") }

      it "Bundler.ui receive error" 


      it "Bundler.ui receive warn" 


      it "Bundler.ui receive trace" 

    end

    context "Interrupt" do
      it "Bundler.ui receive error" 

      it_behaves_like "Bundler.ui receive trace", Interrupt.new
    end

    context "Gem::InvalidSpecificationException" do
      it "Bundler.ui receive error" 

    end

    context "SystemExit" do
      # Does nothing
    end

    context "Java::JavaLang::OutOfMemoryError" do
      module Java
        module JavaLang
          class OutOfMemoryError < StandardError; end
        end
      end

      it "Bundler.ui receive error" 

    end

    context "unexpected error" do
      it "calls request_issue_report_for with error" 

    end
  end

  describe "#exit_status" do
    it "calls status_code for BundlerError" 


    it "returns 15 for Thor::Error" 


    it "calls status for SystemExit" 


    it "returns 1 in other cases" 

  end

  describe "#request_issue_report_for" do
    it "calls relevant methods for Bundler.ui" 


    it "includes error class, message and backlog" 

  end

  describe "#issues_url" do
    it "generates a search URL for the exception message" 


    it "generates a search URL for only the first line of a multi-line exception message" 


    it "generates the url without colons" 


    it "removes information after - for Errono::EACCES" 

  end
end

