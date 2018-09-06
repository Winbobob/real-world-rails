# frozen_string_literal: true

require "bundler/lockfile_parser"

RSpec.describe Bundler::LockfileParser do
  let(:lockfile_contents) { strip_whitespace(<<-L) }
    GIT
      remote: https://github.com/alloy/peiji-san.git
      revision: eca485d8dc95f12aaec1a434b49d295c7e91844b
      specs:
        peiji-san (1.2.0)

    GEM
      remote: https://rubygems.org/
      specs:
        rake (10.3.2)

    PLATFORMS
      ruby

    DEPENDENCIES
      peiji-san!
      rake

    RUBY VERSION
       ruby 2.1.3p242

    BUNDLED WITH
       1.12.0.rc.2
  L

  describe ".sections_in_lockfile" do
    it "returns the attributes" 

  end

  describe ".unknown_sections_in_lockfile" do
    let(:lockfile_contents) { strip_whitespace(<<-L) }
      UNKNOWN ATTR

      UNKNOWN ATTR 2
        random contents
    L

    it "returns the unknown attributes" 

  end

  describe ".sections_to_ignore" do
    subject { described_class.sections_to_ignore(base_version) }

    context "with a nil base version" do
      let(:base_version) { nil }

      it "returns the same as > 1.0" 

    end

    context "with a prerelease base version" do
      let(:base_version) { Gem::Version.create("1.11.0.rc.1") }

      it "returns the same as for the release version" 

    end

    context "with a current version" do
      let(:base_version) { Gem::Version.create(Bundler::VERSION) }

      it "returns an empty array" 

    end

    context "with a future version" do
      let(:base_version) { Gem::Version.create("5.5.5") }

      it "returns an empty array" 

    end
  end

  describe "#initialize" do
    before { allow(Bundler::SharedHelpers).to receive(:find_gemfile).and_return(bundled_app("gems.rb")) }
    subject { described_class.new(lockfile_contents) }

    let(:sources) do
      [Bundler::Source::Git.new("uri" => "https://github.com/alloy/peiji-san.git", "revision" => "eca485d8dc95f12aaec1a434b49d295c7e91844b"),
       Bundler::Source::Rubygems.new("remotes" => ["https://rubygems.org"])]
    end
    let(:dependencies) do
      {
        "peiji-san" => Bundler::Dependency.new("peiji-san", ">= 0"),
        "rake" => Bundler::Dependency.new("rake", ">= 0"),
      }
    end
    let(:specs) do
      [
        Bundler::LazySpecification.new("peiji-san", v("1.2.0"), rb),
        Bundler::LazySpecification.new("rake", v("10.3.2"), rb),
      ]
    end
    let(:platforms) { [rb] }
    let(:bundler_version) { Gem::Version.new("1.12.0.rc.2") }
    let(:ruby_version) { "ruby 2.1.3p242" }

    shared_examples_for "parsing" do
      it "parses correctly" 

    end

    include_examples "parsing"

    context "when an extra section is at the end" do
      let(:lockfile_contents) { super() + "\n\nFOO BAR\n  baz\n   baa\n    qux\n" }
      include_examples "parsing"
    end

    context "when an extra section is at the start" do
      let(:lockfile_contents) { "FOO BAR\n  baz\n   baa\n    qux\n\n" + super() }
      include_examples "parsing"
    end

    context "when an extra section is in the middle" do
      let(:lockfile_contents) { super().split(/(?=GEM)/).insert(1, "FOO BAR\n  baz\n   baa\n    qux\n\n").join }
      include_examples "parsing"
    end

    context "when a dependency has options" do
      let(:lockfile_contents) { super().sub("peiji-san!", "peiji-san!\n    foo: bar") }
      include_examples "parsing"
    end
  end
end

