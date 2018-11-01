# frozen_string_literal: true

RSpec.describe Bundler::Plugin::Index do
  Index = Bundler::Plugin::Index

  before do
    gemfile ""
    path = lib_path(plugin_name)
    index.register_plugin("new-plugin", path.to_s, [path.join("lib").to_s], commands, sources, hooks)
  end

  let(:plugin_name) { "new-plugin" }
  let(:commands) { [] }
  let(:sources) { [] }
  let(:hooks) { [] }

  subject(:index) { Index.new }

  describe "#register plugin" do
    it "is available for retrieval" 


    it "load_paths is available for retrival" 


    it "is persistent" 


    it "load_paths are persistent" 

  end

  describe "commands" do
    let(:commands) { ["newco"] }

    it "returns the plugins name on query" 


    it "raises error on conflict" 


    it "is persistent" 

  end

  describe "source" do
    let(:sources) { ["new_source"] }

    it "returns the plugins name on query" 


    it "raises error on conflict" 


    it "is persistent" 

  end

  describe "hook" do
    let(:hooks) { ["after-bar"] }

    it "returns the plugins name on query" 


    it "is persistent" 


    context "that are not registered", :focused do
      let(:file) { double("index-file") }

      before do
        index.hook_plugins("not-there")
        allow(File).to receive(:open).and_yield(file)
      end

      it "should not save it with next registered hook" 

    end
  end

  describe "global index" do
    before do
      Dir.chdir(tmp) do
        Bundler::Plugin.reset!
        path = lib_path("gplugin")
        index.register_plugin("gplugin", path.to_s, [path.join("lib").to_s], [], ["glb_source"], [])
      end
    end

    it "skips sources" 

  end

  describe "after conflict" do
    let(:commands) { ["foo"] }
    let(:sources) { ["bar"] }
    let(:hooks) { ["hoook"] }

    shared_examples "it cleans up" do
      it "the path" 


      it "the command" 


      it "the source" 


      it "the hook" 

    end

    context "on command conflict it cleans up" do
      before do
        expect do
          path = lib_path("cplugin")
          index.register_plugin("cplugin", path.to_s, [path.join("lib").to_s], ["foo"], ["xbar"], ["xhoook"])
        end.to raise_error(Index::CommandConflict)
      end

      include_examples "it cleans up"
    end

    context "on source conflict it cleans up" do
      before do
        expect do
          path = lib_path("cplugin")
          index.register_plugin("cplugin", path.to_s, [path.join("lib").to_s], ["xfoo"], ["bar"], ["xhoook"])
        end.to raise_error(Index::SourceConflict)
      end

      include_examples "it cleans up"
    end

    context "on command and source conflict it cleans up" do
      before do
        expect do
          path = lib_path("cplugin")
          index.register_plugin("cplugin", path.to_s, [path.join("lib").to_s], ["foo"], ["bar"], ["xhoook"])
        end.to raise_error(Index::CommandConflict)
      end

      include_examples "it cleans up"
    end
  end

  describe "readonly disk without home" do
    it "ignores being unable to create temp home dir" 

  end
end

