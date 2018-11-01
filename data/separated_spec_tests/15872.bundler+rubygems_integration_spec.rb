# frozen_string_literal: true

RSpec.describe Bundler::RubygemsIntegration do
  it "uses the same chdir lock as rubygems", :rubygems => "2.1" 


  context "#validate" do
    let(:spec) do
      Gem::Specification.new do |s|
        s.name = "to-validate"
        s.version = "1.0.0"
        s.loaded_from = __FILE__
      end
    end
    subject { Bundler.rubygems.validate(spec) }

    it "skips overly-strict gemspec validation", :rubygems => "< 1.7" 


    it "validates with packaging mode disabled", :rubygems => "1.7" 


    it "should set a summary to avoid an overly-strict error", :rubygems => "~> 1.7.0" 


    context "with an invalid spec" do
      before do
        expect(spec).to receive(:validate).with(false).
          and_raise(Gem::InvalidSpecificationException.new("TODO is not an author"))
      end

      it "should raise a Gem::InvalidSpecificationException and produce a helpful warning message",
        :rubygems => "1.7" do
        expect { subject }.to raise_error(Gem::InvalidSpecificationException,
          "The gemspec at #{__FILE__} is not valid. "\
          "Please fix this gemspec.\nThe validation error was 'TODO is not an author'\n")
      end
    end
  end

  describe "#configuration" do
    it "handles Gem::SystemExitException errors" 

  end

  describe "#download_gem", :rubygems => ">= 2.0" do
    let(:bundler_retry) { double(Bundler::Retry) }
    let(:retry) { double("Bundler::Retry") }
    let(:uri) {  URI.parse("https://foo.bar") }
    let(:path) { Gem.path.first }
    let(:spec) do
      spec = Bundler::RemoteSpecification.new("Foo", Gem::Version.new("2.5.2"),
        Gem::Platform::RUBY, nil)
      spec.remote = Bundler::Source::Rubygems::Remote.new(uri.to_s)
      spec
    end
    let(:fetcher) { double("gem_remote_fetcher") }

    it "successfully downloads gem with retries" 

  end

  describe "#fetch_all_remote_specs", :rubygems => ">= 2.0" do
    let(:uri) { URI("https://example.com") }
    let(:fetcher) { double("gem_remote_fetcher") }
    let(:specs_response) { Marshal.dump(["specs"]) }
    let(:prerelease_specs_response) { Marshal.dump(["prerelease_specs"]) }

    context "when a rubygems source mirror is set" do
      let(:orig_uri) { URI("http://zombo.com") }
      let(:remote_with_mirror) { double("remote", :uri => uri, :original_uri => orig_uri) }

      it "sets the 'X-Gemfile-Source' header containing the original source" 

    end

    context "when there is no rubygems source mirror set" do
      let(:remote_no_mirror) { double("remote", :uri => uri, :original_uri => nil) }

      it "does not set the 'X-Gemfile-Source' header" 

    end
  end
end

