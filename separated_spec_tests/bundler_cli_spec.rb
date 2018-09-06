# frozen_string_literal: true

require "bundler/cli"

RSpec.describe "bundle executable" do
  it "returns non-zero exit status when passed unrecognized options" 


  it "returns non-zero exit status when passed unrecognized task" 


  it "looks for a binary and executes it if it's named bundler-<task>" 


  context "with no arguments" do
    it "prints a concise help message", :bundler => "2" 

  end

  context "when ENV['BUNDLE_GEMFILE'] is set to an empty string" do
    it "ignores it" 

  end

  context "when ENV['RUBYGEMS_GEMDEPS'] is set" do
    it "displays a warning" 

  end

  context "with --verbose" do
    it "prints the running command" 


    it "doesn't print defaults" 


    it "doesn't print defaults" 

  end

  describe "printing the outdated warning" do
    shared_examples_for "no warning" do
      it "prints no warning" 

    end

    let(:bundler_version) { "1.1" }
    let(:latest_version) { nil }
    before do
      bundle! "config --global disable_version_check false"

      simulate_bundler_version(bundler_version)
      if latest_version
        info_path = home(".bundle/cache/compact_index/rubygems.org.443.29b0360b937aa4d161703e6160654e47/info/bundler")
        info_path.parent.mkpath
        info_path.open("w") {|f| f.write "#{latest_version}\n" }
      end
    end

    context "when there is no latest version" do
      include_examples "no warning"
    end

    context "when the latest version is equal to the current version" do
      let(:latest_version) { bundler_version }
      include_examples "no warning"
    end

    context "when the latest version is less than the current version" do
      let(:latest_version) { "0.9" }
      include_examples "no warning"
    end

    context "when the latest version is greater than the current version" do
      let(:latest_version) { "222.0" }
      it "prints the version warning" 


      context "and disable_version_check is set" do
        before { bundle! "config disable_version_check true" }
        include_examples "no warning"
      end

      context "running a parseable command" do
        it "prints no warning" 

      end

      context "and is a pre-release" do
        let(:latest_version) { "222.0.0.pre.4" }
        it "prints the version warning" 

      end
    end
  end
end

RSpec.describe "bundler executable" do
  it "shows the bundler version just as the `bundle` executable does", :bundler => "< 2" 


  it "shows the bundler version just as the `bundle` executable does", :bundler => "2" 

end

