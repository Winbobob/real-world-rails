# frozen_string_literal: true

require "bundler/settings"

RSpec.describe Bundler::Env do
  let(:git_proxy_stub) { Bundler::Source::Git::GitProxy.new(nil, nil, nil) }

  describe "#report" do
    it "prints the environment" 


    context "when there is a Gemfile and a lockfile and print_gemfile is true" do
      before do
        gemfile "gem 'rack', '1.0.0'"

        lockfile <<-L
          GEM
            remote: file:#{gem_repo1}/
            specs:
              rack (1.0.0)

          DEPENDENCIES
            rack

          BUNDLED WITH
             1.10.0
        L
      end

      let(:output) { described_class.report(:print_gemfile => true) }

      it "prints the Gemfile" 


      it "prints the lockfile" 

    end

    context "when there no Gemfile and print_gemfile is true" do
      let(:output) { described_class.report(:print_gemfile => true) }

      it "prints the environment" 

    end

    context "when Gemfile contains a gemspec and print_gemspecs is true" do
      let(:gemspec) do
        strip_whitespace(<<-GEMSPEC)
          Gem::Specification.new do |gem|
            gem.name = "foo"
            gem.author = "Fumofu"
          end
        GEMSPEC
      end

      before do
        gemfile("gemspec")

        File.open(bundled_app.join("foo.gemspec"), "wb") do |f|
          f.write(gemspec)
        end
      end

      it "prints the gemspec" 

    end

    context "when eval_gemfile is used" do
      it "prints all gemfiles" 

    end

    context "when the git version is OS specific" do
      it "includes OS specific information with the version number" 

    end
  end

  describe ".version_of" do
    let(:parsed_version) { described_class.send(:version_of, "ruby") }

    it "strips version of new line characters" 

  end
end

