# frozen_string_literal: true

RSpec.describe Bundler::Fetcher::Dependency do
  let(:downloader)  { double(:downloader) }
  let(:remote)      { double(:remote, :uri => URI("http://localhost:5000")) }
  let(:display_uri) { "http://sample_uri.com" }

  subject { described_class.new(downloader, remote, display_uri) }

  describe "#available?" do
    let(:dependency_api_uri) { double(:dependency_api_uri) }
    let(:fetched_spec)       { double(:fetched_spec) }

    before do
      allow(subject).to receive(:dependency_api_uri).and_return(dependency_api_uri)
      allow(downloader).to receive(:fetch).with(dependency_api_uri).and_return(fetched_spec)
    end

    it "should be truthy" 


    context "when there is no network access" do
      before do
        allow(downloader).to receive(:fetch).with(dependency_api_uri) {
          raise Bundler::Fetcher::NetworkDownError.new("Network Down Message")
        }
      end

      it "should raise an HTTPError with the original message" 

    end

    context "when authentication is required" do
      let(:remote_uri) { "http://remote_uri.org" }

      before do
        allow(downloader).to receive(:fetch).with(dependency_api_uri) {
          raise Bundler::Fetcher::AuthenticationRequiredError.new(remote_uri)
        }
      end

      it "should raise the original error" 

    end

    context "when there is an http error" do
      before { allow(downloader).to receive(:fetch).with(dependency_api_uri) { raise Bundler::HTTPError.new } }

      it "should be falsey" 

    end
  end

  describe "#api_fetcher?" do
    it "should return true" 

  end

  describe "#specs" do
    let(:gem_names)            { %w[foo bar] }
    let(:full_dependency_list) { ["bar"] }
    let(:last_spec_list)       { [["boulder", gem_version1, "ruby", resque]] }
    let(:fail_errors)          { double(:fail_errors) }
    let(:bundler_retry)        { double(:bundler_retry) }
    let(:gem_version1)         { double(:gem_version1) }
    let(:resque)               { double(:resque) }
    let(:remote_uri)           { "http://remote-uri.org" }

    before do
      stub_const("Bundler::Fetcher::FAIL_ERRORS", fail_errors)
      allow(Bundler::Retry).to receive(:new).with("dependency api", fail_errors).and_return(bundler_retry)
      allow(bundler_retry).to receive(:attempts) {|&block| block.call }
      allow(subject).to receive(:log_specs) {}
      allow(subject).to receive(:remote_uri).and_return(remote_uri)
      allow(Bundler).to receive_message_chain(:ui, :debug?)
      allow(Bundler).to receive_message_chain(:ui, :info)
      allow(Bundler).to receive_message_chain(:ui, :debug)
    end

    context "when there are given gem names that are not in the full dependency list" do
      let(:spec_list)        { [["top", gem_version2, "ruby", faraday]] }
      let(:deps_list)        { [] }
      let(:dependency_specs) { [spec_list, deps_list] }
      let(:gem_version2)     { double(:gem_version2) }
      let(:faraday)          { double(:faraday) }

      before { allow(subject).to receive(:dependency_specs).with(["foo"]).and_return(dependency_specs) }

      it "should return a hash with the remote_uri and the list of specs" 

    end

    context "when all given gem names are in the full dependency list" do
      let(:gem_names)            { ["foo"] }
      let(:full_dependency_list) { %w[foo bar] }
      let(:last_spec_list)       { ["boulder"] }

      it "should return a hash with the remote_uri and the last spec list" 

    end

    context "logging" do
      before { allow(subject).to receive(:log_specs).and_call_original }

      context "with debug on" do
        before do
          allow(Bundler).to receive_message_chain(:ui, :debug?).and_return(true)
          allow(subject).to receive(:dependency_specs).with(["foo"]).and_return([[], []])
        end

        it "should log the query list at debug level" 

      end

      context "with debug off" do
        before do
          allow(Bundler).to receive_message_chain(:ui, :debug?).and_return(false)
          allow(subject).to receive(:dependency_specs).with(["foo"]).and_return([[], []])
        end

        it "should log at info level" 

      end
    end

    shared_examples_for "the error is properly handled" do
      it "should return nil" 


      context "debug logging is not on" do
        before { allow(Bundler).to receive_message_chain(:ui, :debug?).and_return(false) }

        it "should log a new line to info" 

      end
    end

    shared_examples_for "the error suggests retrying with the full index" do
      it "should log the inability to fetch from API at debug level" 

    end

    context "when an HTTPError occurs" do
      before { allow(subject).to receive(:dependency_specs) { raise Bundler::HTTPError.new } }

      it_behaves_like "the error is properly handled"
      it_behaves_like "the error suggests retrying with the full index"
    end

    context "when a GemspecError occurs" do
      before { allow(subject).to receive(:dependency_specs) { raise Bundler::GemspecError.new } }

      it_behaves_like "the error is properly handled"
      it_behaves_like "the error suggests retrying with the full index"
    end

    context "when a MarshalError occurs" do
      before { allow(subject).to receive(:dependency_specs) { raise Bundler::MarshalError.new } }

      it_behaves_like "the error is properly handled"

      it "should log the inability to fetch from API and mention retrying" 

    end
  end

  describe "#dependency_specs" do
    let(:gem_names)                { [%w[foo bar], %w[bundler rubocop]] }
    let(:gem_list)                 { double(:gem_list) }
    let(:formatted_specs_and_deps) { double(:formatted_specs_and_deps) }

    before do
      allow(subject).to receive(:unmarshalled_dep_gems).with(gem_names).and_return(gem_list)
      allow(subject).to receive(:get_formatted_specs_and_deps).with(gem_list).and_return(formatted_specs_and_deps)
    end

    it "should log the query list at debug level" 


    it "should return formatted specs and a unique list of dependencies" 

  end

  describe "#unmarshalled_dep_gems" do
    let(:gem_names)         { [%w[foo bar], %w[bundler rubocop]] }
    let(:dep_api_uri)       { double(:dep_api_uri) }
    let(:unmarshalled_gems) { double(:unmarshalled_gems) }
    let(:fetch_response)    { double(:fetch_response, :body => double(:body)) }
    let(:rubygems_limit)    { 50 }

    before { allow(subject).to receive(:dependency_api_uri).with(gem_names).and_return(dep_api_uri) }

    it "should fetch dependencies from RubyGems and unmarshal them" 

  end

  describe "#get_formatted_specs_and_deps" do
    let(:gem_list) do
      [
        {
          :dependencies => {
            "resque" => "req3,req4",
          },
          :name => "typhoeus",
          :number => "1.0.1",
          :platform => "ruby",
        },
        {
          :dependencies => {
            "faraday" => "req1,req2",
          },
          :name => "grape",
          :number => "2.0.2",
          :platform => "jruby",
        },
      ]
    end

    it "should return formatted specs and a unique list of dependencies" 

  end

  describe "#dependency_api_uri" do
    let(:uri) { URI("http://gem-api.com") }

    context "with gem names" do
      let(:gem_names) { %w[foo bar bundler rubocop] }

      before { allow(subject).to receive(:fetch_uri).and_return(uri) }

      it "should return an api calling uri with the gems in the query" 

    end

    context "with no gem names" do
      let(:gem_names) { [] }

      before { allow(subject).to receive(:fetch_uri).and_return(uri) }

      it "should return an api calling uri with no query" 

    end
  end
end
