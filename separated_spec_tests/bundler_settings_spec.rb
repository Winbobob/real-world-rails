# frozen_string_literal: true

require "bundler/settings"

RSpec.describe Bundler::Settings do
  subject(:settings) { described_class.new(bundled_app) }

  describe "#set_local" do
    context "when the local config file is not found" do
      subject(:settings) { described_class.new(nil) }

      it "raises a GemfileNotFound error with explanation" 

    end
  end

  describe "load_config" do
    let(:hash) do
      {
        "build.thrift" => "--with-cppflags=-D_FORTIFY_SOURCE=0",
        "build.libv8" => "--with-system-v8",
        "build.therubyracer" => "--with-v8-dir",
        "build.pg" => "--with-pg-config=/usr/local/Cellar/postgresql92/9.2.8_1/bin/pg_config",
        "gem.coc" => "false",
        "gem.mit" => "false",
        "gem.test" => "minitest",
        "thingy" => <<-EOS.tr("\n", " "),
--asdf --fdsa --ty=oh man i hope this doesnt break bundler because
that would suck --ehhh=oh geez it looks like i might have broken bundler somehow
--very-important-option=DontDeleteRoo
--very-important-option=DontDeleteRoo
--very-important-option=DontDeleteRoo
--very-important-option=DontDeleteRoo
        EOS
        "xyz" => "zyx",
      }
    end

    before do
      hash.each do |key, value|
        settings.set_local key, value
      end
    end

    it "can load the config" 


    context "when BUNDLE_IGNORE_CONFIG is set" do
      before { ENV["BUNDLE_IGNORE_CONFIG"] = "TRUE" }

      it "ignores the config" 

    end
  end

  describe "#global_config_file" do
    context "when $HOME is not accessible" do
      context "when $TMPDIR is not writable" do
        it "does not raise" 

      end
    end
  end

  describe "#[]" do
    context "when the local config file is not found" do
      subject(:settings) { described_class.new }

      it "does not raise" 

    end

    context "when not set" do
      context "when default value present" do
        it "retrieves value" 

      end

      it "returns nil" 

    end

    context "when is boolean" do
      it "returns a boolean" 

      context "when specific gem is configured" do
        it "returns a boolean" 

      end
    end

    context "when is number" do
      it "returns a number" 

    end

    context "when it's not possible to write to the file" do
      it "raises an PermissionError with explanation" 

    end
  end

  describe "#temporary" do
    it "reset after used" 


    it "returns the return value of the block" 


    context "when called without a block" do
      it "leaves the setting changed" 


      it "returns nil" 

    end
  end

  describe "#set_global" do
    context "when it's not possible to write to the file" do
      it "raises an PermissionError with explanation" 

    end
  end

  describe "#pretty_values_for" do
    it "prints the converted value rather than the raw string" 

  end

  describe "#mirror_for" do
    let(:uri) { URI("https://rubygems.org/") }

    context "with no configured mirror" do
      it "returns the original URI" 


      it "converts a string parameter to a URI" 

    end

    context "with a configured mirror" do
      let(:mirror_uri) { URI("https://rubygems-mirror.org/") }

      before { settings.set_local "mirror.https://rubygems.org/", mirror_uri.to_s }

      it "returns the mirror URI" 


      it "converts a string parameter to a URI" 


      it "normalizes the URI" 


      it "is case insensitive" 


      context "with a file URI" do
        let(:mirror_uri) { URI("file:/foo/BAR/baz/qUx/") }

        it "returns the mirror URI" 


        it "converts a string parameter to a URI" 


        it "normalizes the URI" 

      end
    end
  end

  describe "#credentials_for" do
    let(:uri) { URI("https://gemserver.example.org/") }
    let(:credentials) { "username:password" }

    context "with no configured credentials" do
      it "returns nil" 

    end

    context "with credentials configured by URL" do
      before { settings.set_local "https://gemserver.example.org/", credentials }

      it "returns the configured credentials" 

    end

    context "with credentials configured by hostname" do
      before { settings.set_local "gemserver.example.org", credentials }

      it "returns the configured credentials" 

    end
  end

  describe "URI normalization" do
    it "normalizes HTTP URIs in credentials configuration" 


    it "normalizes HTTPS URIs in credentials configuration" 


    it "normalizes HTTP URIs in mirror configuration" 


    it "normalizes HTTPS URIs in mirror configuration" 


    it "does not normalize other config keys that happen to contain 'http'" 


    it "does not normalize other config keys that happen to contain 'https'" 


    it "reads older keys without trailing slashes" 


    it "normalizes URIs with a fallback_timeout option" 


    it "normalizes URIs with a fallback_timeout option without a trailing slash" 

  end

  describe "BUNDLE_ keys format" do
    let(:settings) { described_class.new(bundled_app(".bundle")) }

    it "converts older keys without double dashes" 


    it "converts older keys without trailing slashes and double dashes" 


    it "reads newer keys format properly" 

  end
end

