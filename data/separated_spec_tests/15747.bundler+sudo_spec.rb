# frozen_string_literal: true

RSpec.describe "when using sudo", :sudo => true do
  describe "and BUNDLE_PATH is writable" do
    context "but BUNDLE_PATH/build_info is not writable" do
      before do
        bundle! "config path.system true"
        subdir = system_gem_path("cache")
        subdir.mkpath
        sudo "chmod u-w #{subdir}"
      end

      it "installs" 

    end
  end

  describe "and GEM_HOME is owned by root" do
    before :each do
      bundle! "config path.system true"
      chown_system_gems_to_root
    end

    it "installs" 


    it "installs rake and a gem dependent on rake in the same session" 


    it "installs when BUNDLE_PATH is owned by root" 


    it "installs when BUNDLE_PATH does not exist" 


    it "installs extensions/ compiled by RubyGems 2.2", :rubygems => "2.2" 

  end

  describe "and BUNDLE_PATH is not writable" do
    before do
      sudo "chmod ugo-w #{default_bundle_path}"
    end

    it "installs" 


    it "cleans up the tmpdirs generated" 

  end

  describe "and GEM_HOME is not writable" do
    it "installs" 

  end

  describe "and root runs install" do
    let(:warning) { "Don't run Bundler as root." }

    before do
      gemfile %(source "file://#{gem_repo1}")
    end

    it "warns against that" 


    context "when ENV['BUNDLE_SILENCE_ROOT_WARNING'] is set" do
      it "skips the warning" 

    end

    context "when silence_root_warning = false" do
      it "warns against that" 

    end
  end
end

