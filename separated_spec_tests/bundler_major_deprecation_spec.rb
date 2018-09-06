# frozen_string_literal: true

RSpec.describe "major deprecations", :bundler => "< 2" do
  let(:warnings) { last_command.bundler_err } # change to err in 2.0
  let(:warnings_without_version_messages) { warnings.gsub(/#{Spec::Matchers::MAJOR_DEPRECATION}Bundler will only support ruby(gems)? >= .*/, "") }

  context "in a .99 version" do
    before do
      simulate_bundler_version "1.99.1"
      bundle "config --delete major_deprecations"
    end

    it "prints major deprecations without being configured" 

  end

  before do
    bundle "config major_deprecations true"

    create_file "gems.rb", <<-G
      source "file:#{gem_repo1}"
      ruby #{RUBY_VERSION.dump}
      gem "rack"
    G
    bundle! "install"
  end

  describe "bundle_ruby" do
    it "prints a deprecation" 

  end

  describe "Bundler" do
    describe ".clean_env" do
      it "is deprecated in favor of .original_env" 

    end

    describe ".environment" do
      it "is deprecated in favor of .load" 

    end

    shared_examples_for "environmental deprecations" do |trigger|
      describe "ruby version", :ruby => "< 2.0" do
        it "requires a newer ruby version" 

      end

      describe "rubygems version", :rubygems => "< 2.0" do
        it "requires a newer rubygems version" 

      end
    end

    describe "-rbundler/setup" do
      it_behaves_like "environmental deprecations", proc { ruby "require 'bundler/setup'" }
    end

    describe "Bundler.setup" do
      it_behaves_like "environmental deprecations", proc { ruby "require 'bundler'; Bundler.setup" }
    end

    describe "bundle check" do
      it_behaves_like "environmental deprecations", proc { bundle :check }
    end

    describe "bundle update --quiet" do
      it "does not print any deprecations" 

    end

    describe "bundle update" do
      before do
        create_file("gems.rb", "")
        bundle! "install"
      end

      it "warns when no options are given" 


      it "does not warn when --all is passed" 

    end

    describe "bundle install --binstubs" do
      it "should output a deprecation warning" 

    end
  end

  context "when bundle is run" do
    it "should not warn about gems.rb" 


    it "should print a Gemfile deprecation warning" 


    context "with flags" do
      it "should print a deprecation warning about autoremembering flags" 

    end
  end

  context "when Bundler.setup is run in a ruby script" do
    it "should print a single deprecation warning" 

  end

  context "when `bundler/deployment` is required in a ruby script" do
    it "should print a capistrano deprecation warning" 

  end

  describe Bundler::Dsl do
    before do
      @rubygems = double("rubygems")
      allow(Bundler::Source::Rubygems).to receive(:new) { @rubygems }
    end

    context "with github gems" do
      it "warns about the https change" 


      it "upgrades to https on request" 

    end

    context "with bitbucket gems" do
      it "warns about removal" 

    end

    context "with gist gems" do
      it "warns about removal" 

    end
  end

  context "bundle show" do
    it "prints a deprecation warning" 

  end

  context "bundle console" do
    it "prints a deprecation warning" 

  end
end

