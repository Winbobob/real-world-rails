# frozen_string_literal: true

require "bundler/fetcher"

RSpec.describe Bundler::Fetcher do
  let(:uri) { URI("https://example.com") }
  let(:remote) { double("remote", :uri => uri, :original_uri => nil) }

  subject(:fetcher) { Bundler::Fetcher.new(remote) }

  before do
    allow(Bundler).to receive(:root) { Pathname.new("root") }
  end

  describe "#connection" do
    context "when Gem.configuration doesn't specify http_proxy" do
      it "specify no http_proxy" 

      it "consider environment vars when determine proxy" 

    end
    context "when Gem.configuration specifies http_proxy " do
      let(:proxy) { "http://proxy-example2.com" }
      before do
        allow(Bundler.rubygems.configuration).to receive(:[]).with(:http_proxy).and_return(proxy)
      end
      it "consider Gem.configuration when determine proxy" 

      it "consider Gem.configuration when determine proxy" 

      context "when the proxy is :no_proxy" do
        let(:proxy) { :no_proxy }
        it "does not set a proxy" 

      end
    end

    context "when a rubygems source mirror is set" do
      let(:orig_uri) { URI("http://zombo.com") }
      let(:remote_with_mirror) do
        double("remote", :uri => uri, :original_uri => orig_uri, :anonymized_uri => uri)
      end

      let(:fetcher) { Bundler::Fetcher.new(remote_with_mirror) }

      it "sets the 'X-Gemfile-Source' header containing the original source" 

    end

    context "when there is no rubygems source mirror set" do
      let(:remote_no_mirror) do
        double("remote", :uri => uri, :original_uri => nil, :anonymized_uri => uri)
      end

      let(:fetcher) { Bundler::Fetcher.new(remote_no_mirror) }

      it "does not set the 'X-Gemfile-Source' header" 

    end

    context "when there are proxy environment variable(s) set" do
      it "consider http_proxy" 

      it "consider no_proxy" 

    end

    context "when no ssl configuration is set" do
      it "no cert" 

    end

    context "when bunder ssl ssl configuration is set" do
      before do
        cert = File.join(Spec::Path.tmpdir, "cert")
        File.open(cert, "w") {|f| f.write "PEM" }
        allow(Bundler.settings).to receive(:[]).and_return(nil)
        allow(Bundler.settings).to receive(:[]).with(:ssl_client_cert).and_return(cert)
        expect(OpenSSL::X509::Certificate).to receive(:new).with("PEM").and_return("cert")
        expect(OpenSSL::PKey::RSA).to receive(:new).with("PEM").and_return("key")
      end
      after do
        FileUtils.rm File.join(Spec::Path.tmpdir, "cert")
      end
      it "use bundler configuration" 

    end

    context "when gem ssl configuration is set" do
      before do
        allow(Bundler.rubygems.configuration).to receive_messages(
          :http_proxy => nil,
          :ssl_client_cert => "cert",
          :ssl_ca_cert => "ca"
        )
        expect(File).to receive(:read).and_return("")
        expect(OpenSSL::X509::Certificate).to receive(:new).and_return("cert")
        expect(OpenSSL::PKey::RSA).to receive(:new).and_return("key")
        store = double("ca store")
        expect(store).to receive(:add_file)
        expect(OpenSSL::X509::Store).to receive(:new).and_return(store)
      end
      it "use gem configuration" 

    end
  end

  describe "#user_agent" do
    it "builds user_agent with current ruby version and Bundler settings" 


    describe "include CI information" do
      it "from one CI" 


      it "from many CI" 

    end
  end
end

