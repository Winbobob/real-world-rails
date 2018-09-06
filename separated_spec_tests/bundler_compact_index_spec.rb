# frozen_string_literal: true

RSpec.describe Bundler::Fetcher::CompactIndex do
  let(:downloader)  { double(:downloader) }
  let(:display_uri) { URI("http://sampleuri.com") }
  let(:remote)      { double(:remote, :cache_slug => "lsjdf", :uri => display_uri) }
  let(:compact_index) { described_class.new(downloader, remote, display_uri) }

  before do
    allow(compact_index).to receive(:log_specs) {}
  end

  describe "#specs_for_names" do
    it "has only one thread open at the end of the run" 


    it "calls worker#stop during the run" 


    describe "#available?" do
      before do
        allow(compact_index).to receive(:compact_index_client).
          and_return(double(:compact_index_client, :update_and_parse_checksums! => true))
      end

      it "returns true" 


      context "when OpenSSL is not available" do
        before do
          allow(compact_index).to receive(:require).with("openssl").and_raise(LoadError)
        end

        it "returns true" 

      end

      context "when OpenSSL is FIPS-enabled", :ruby => ">= 2.0.0" do
        def remove_cached_md5_availability
          return unless Bundler::SharedHelpers.instance_variable_defined?(:@md5_available)
          Bundler::SharedHelpers.remove_instance_variable(:@md5_available)
        end

        before do
          remove_cached_md5_availability
          stub_const("OpenSSL::OPENSSL_FIPS", true)
        end

        after { remove_cached_md5_availability }

        context "when FIPS-mode is active" do
          before do
            allow(OpenSSL::Digest::MD5).to receive(:digest).
              and_raise(OpenSSL::Digest::DigestError)
          end

          it "returns false" 

        end

        it "returns true" 

      end
    end

    context "logging" do
      before { allow(compact_index).to receive(:log_specs).and_call_original }

      context "with debug on" do
        before do
          allow(Bundler).to receive_message_chain(:ui, :debug?).and_return(true)
        end

        it "should log at info level" 

      end

      context "with debug off" do
        before do
          allow(Bundler).to receive_message_chain(:ui, :debug?).and_return(false)
        end

        it "should log at info level" 

      end
    end
  end
end

