# frozen_string_literal: true

RSpec.describe Bundler::SourceList do
  before do
    allow(Bundler).to receive(:root) { Pathname.new "./tmp/bundled_app" }

    stub_const "ASourcePlugin", Class.new(Bundler::Plugin::API)
    ASourcePlugin.source "new_source"
    allow(Bundler::Plugin).to receive(:source?).with("new_source").and_return(true)
  end

  subject(:source_list) { Bundler::SourceList.new }

  let(:rubygems_aggregate) { Bundler::Source::Rubygems.new }
  let(:metadata_source) { Bundler::Source::Metadata.new }

  describe "adding sources" do
    before do
      source_list.add_path_source("path" => "/existing/path/to/gem")
      source_list.add_git_source("uri" => "git://existing-git.org/path.git")
      source_list.add_rubygems_source("remotes" => ["https://existing-rubygems.org"])
      source_list.add_plugin_source("new_source", "uri" => "https://some.url/a")
    end

    describe "#add_path_source" do
      before do
        @duplicate = source_list.add_path_source("path" => "/path/to/gem")
        @new_source = source_list.add_path_source("path" => "/path/to/gem")
      end

      it "returns the new path source" 


      it "passes the provided options to the new source" 


      it "adds the source to the beginning of path_sources" 


      it "removes existing duplicates" 

    end

    describe "#add_git_source" do
      before do
        @duplicate = source_list.add_git_source("uri" => "git://host/path.git")
        @new_source = source_list.add_git_source("uri" => "git://host/path.git")
      end

      it "returns the new git source" 


      it "passes the provided options to the new source" 


      it "adds the source to the beginning of git_sources" 


      it "removes existing duplicates" 


      context "with the git: protocol" do
        let(:msg) do
          "The git source `git://existing-git.org/path.git` " \
          "uses the `git` protocol, which transmits data without encryption. " \
          "Disable this warning with `bundle config git.allow_insecure true`, " \
          "or switch to the `https` protocol to keep your data secure."
        end

        it "warns about git protocols" 


        it "ignores git protocols on request" 

      end
    end

    describe "#add_rubygems_source" do
      before do
        @duplicate = source_list.add_rubygems_source("remotes" => ["https://rubygems.org/"])
        @new_source = source_list.add_rubygems_source("remotes" => ["https://rubygems.org/"])
      end

      it "returns the new rubygems source" 


      it "passes the provided options to the new source" 


      it "adds the source to the beginning of rubygems_sources" 


      it "removes duplicates" 

    end

    describe "#add_rubygems_remote", :bundler => "< 2" do
      let!(:returned_source) { source_list.add_rubygems_remote("https://rubygems.org/") }

      it "returns the aggregate rubygems source" 


      it "adds the provided remote to the beginning of the aggregate source" 

    end

    describe "#add_plugin_source" do
      before do
        @duplicate = source_list.add_plugin_source("new_source", "uri" => "http://host/path.")
        @new_source = source_list.add_plugin_source("new_source", "uri" => "http://host/path.")
      end

      it "returns the new plugin source" 


      it "passes the provided options to the new source" 


      it "adds the source to the beginning of git_sources" 


      it "removes existing duplicates" 

    end
  end

  describe "#all_sources" do
    it "includes the aggregate rubygems source when rubygems sources have been added" 


    it "includes the aggregate rubygems source when no rubygems sources have been added" 


    it "returns sources of the same type in the reverse order that they were added" 

  end

  describe "#path_sources" do
    it "returns an empty array when no path sources have been added" 


    it "returns path sources in the reverse order that they were added" 

  end

  describe "#git_sources" do
    it "returns an empty array when no git sources have been added" 


    it "returns git sources in the reverse order that they were added" 

  end

  describe "#plugin_sources" do
    it "returns an empty array when no plugin sources have been added" 


    it "returns plugin sources in the reverse order that they were added" 

  end

  describe "#rubygems_sources" do
    it "includes the aggregate rubygems source when rubygems sources have been added" 


    it "returns only the aggregate rubygems source when no rubygems sources have been added" 


    it "returns rubygems sources in the reverse order that they were added" 

  end

  describe "#get" do
    context "when it includes an equal source" do
      let(:rubygems_source) { Bundler::Source::Rubygems.new("remotes" => ["https://rubygems.org"]) }
      before { @equal_source = source_list.add_rubygems_remote("https://rubygems.org") }

      it "returns the equal source" 

    end

    context "when it does not include an equal source" do
      let(:path_source) { Bundler::Source::Path.new("path" => "/path/to/gem") }

      it "returns nil" 

    end
  end

  describe "#lock_sources" do
    before do
      source_list.add_git_source("uri" => "git://third-git.org/path.git")
      source_list.add_rubygems_source("remotes" => ["https://duplicate-rubygems.org"])
      source_list.add_plugin_source("new_source", "uri" => "https://third-bar.org/foo")
      source_list.add_path_source("path" => "/third/path/to/gem")
      source_list.add_rubygems_source("remotes" => ["https://third-rubygems.org"])
      source_list.add_path_source("path" => "/second/path/to/gem")
      source_list.add_rubygems_source("remotes" => ["https://second-rubygems.org"])
      source_list.add_git_source("uri" => "git://second-git.org/path.git")
      source_list.add_rubygems_source("remotes" => ["https://first-rubygems.org"])
      source_list.add_plugin_source("new_source", "uri" => "https://second-plugin.org/random")
      source_list.add_path_source("path" => "/first/path/to/gem")
      source_list.add_rubygems_source("remotes" => ["https://duplicate-rubygems.org"])
      source_list.add_git_source("uri" => "git://first-git.org/path.git")
    end

    it "combines the rubygems sources into a single instance, removing duplicate remotes from the end", :bundler => "< 2" 


    it "returns all sources, without combining rubygems sources", :bundler => "2" 

  end

  describe "replace_sources!" do
    let(:existing_locked_source) { Bundler::Source::Path.new("path" => "/existing/path") }
    let(:removed_locked_source)  { Bundler::Source::Path.new("path" => "/removed/path") }

    let(:locked_sources) { [existing_locked_source, removed_locked_source] }

    before do
      @existing_source = source_list.add_path_source("path" => "/existing/path")
      @new_source = source_list.add_path_source("path" => "/new/path")
      source_list.replace_sources!(locked_sources)
    end

    it "maintains the order and number of sources" 


    it "retains the same instance of the new source" 


    it "replaces the instance of the existing source" 

  end

  describe "#cached!" do
    let(:rubygems_source) { source_list.add_rubygems_source("remotes" => ["https://rubygems.org"]) }
    let(:git_source)      { source_list.add_git_source("uri" => "git://host/path.git") }
    let(:path_source)     { source_list.add_path_source("path" => "/path/to/gem") }

    it "calls #cached! on all the sources" 

  end

  describe "#remote!" do
    let(:rubygems_source) { source_list.add_rubygems_source("remotes" => ["https://rubygems.org"]) }
    let(:git_source)      { source_list.add_git_source("uri" => "git://host/path.git") }
    let(:path_source)     { source_list.add_path_source("path" => "/path/to/gem") }

    it "calls #remote! on all the sources" 

  end
end

