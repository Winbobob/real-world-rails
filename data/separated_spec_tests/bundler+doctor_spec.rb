# frozen_string_literal: true

require "find"
require "stringio"
require "bundler/cli"
require "bundler/cli/doctor"

RSpec.describe "bundle doctor" do
  before(:each) do
    install_gemfile! <<-G
      source "file://#{gem_repo1}"
      gem "rack"
    G

    @stdout = StringIO.new

    [:error, :warn].each do |method|
      allow(Bundler.ui).to receive(method).and_wrap_original do |m, message|
        m.call message
        @stdout.puts message
      end
    end
  end

  context "when all files in home are readable/writable" do
    before(:each) do
      stat = double("stat")
      unwritable_file = double("file")
      allow(Find).to receive(:find).with(Bundler.home.to_s) { [unwritable_file] }
      allow(File).to receive(:stat).with(unwritable_file) { stat }
      allow(stat).to receive(:uid) { Process.uid }
      allow(File).to receive(:writable?).with(unwritable_file) { true }
      allow(File).to receive(:readable?).with(unwritable_file) { true }
    end

    it "exits with no message if the installed gem has no C extensions" 


    it "exits with no message if the installed gem's C extension dylib breakage is fine" 


    it "exits with a message if one of the linked libraries is missing" 

  end

  context "when home contains files that are not readable/writable" do
    before(:each) do
      @stat = double("stat")
      @unwritable_file = double("file")
      allow(Find).to receive(:find).with(Bundler.home.to_s) { [@unwritable_file] }
      allow(File).to receive(:stat).with(@unwritable_file) { @stat }
    end

    it "exits with an error if home contains files that are not readable/writable" 


    context "when home contains files that are not owned by the current process" do
      before(:each) do
        allow(@stat).to receive(:uid) { 0o0000 }
      end

      it "exits with an error if home contains files that are not readable/writable and are not owned by the current user" 


      it "exits with a warning if home contains files that are read/write but not owned by current user" 

    end
  end
end

