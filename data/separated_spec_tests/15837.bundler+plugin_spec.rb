# frozen_string_literal: true

RSpec.describe Bundler::Plugin do
  Plugin = Bundler::Plugin

  let(:installer) { double(:installer) }
  let(:index) { double(:index) }
  let(:spec) { double(:spec) }
  let(:spec2) { double(:spec2) }

  before do
    build_lib "new-plugin", :path => lib_path("new-plugin") do |s|
      s.write "plugins.rb"
    end

    build_lib "another-plugin", :path => lib_path("another-plugin") do |s|
      s.write "plugins.rb"
    end

    allow(spec).to receive(:full_gem_path).
      and_return(lib_path("new-plugin").to_s)
    allow(spec).to receive(:load_paths).
      and_return([lib_path("new-plugin").join("lib").to_s])

    allow(spec2).to receive(:full_gem_path).
      and_return(lib_path("another-plugin").to_s)
    allow(spec2).to receive(:load_paths).
      and_return([lib_path("another-plugin").join("lib").to_s])

    allow(Plugin::Installer).to receive(:new) { installer }
    allow(Plugin).to receive(:index) { index }
    allow(index).to receive(:register_plugin)
  end

  describe "list command" do
    context "when no plugins are installed" do
      before { allow(index).to receive(:installed_plugins) { [] } }
      it "outputs no plugins installed" 

    end

    context "with installed plugins" do
      before do
        allow(index).to receive(:installed_plugins) { %w[plug1 plug2] }
        allow(index).to receive(:plugin_commands).with("plug1") { %w[c11 c12] }
        allow(index).to receive(:plugin_commands).with("plug2") { %w[c21 c22] }
      end
      it "list plugins followed by commands" 

    end
  end

  describe "install command" do
    let(:opts) { { "version" => "~> 1.0", "source" => "foo" } }

    before do
      allow(installer).to receive(:install).with(["new-plugin"], opts) do
        { "new-plugin" => spec }
      end
    end

    it "passes the name and options to installer" 


    it "validates the installed plugin" 


    it "registers the plugin with index" 


    context "multiple plugins" do
      it do
        allow(installer).to receive(:install).
          with(["new-plugin", "another-plugin"], opts) do
          {
            "new-plugin" => spec,
            "another-plugin" => spec2,
          }
        end.once

        allow(subject).to receive(:validate_plugin!).twice
        allow(index).to receive(:register_plugin).twice
        subject.install ["new-plugin", "another-plugin"], opts
      end
    end
  end

  describe "evaluate gemfile for plugins" do
    let(:definition) { double("definition") }
    let(:builder) { double("builder") }
    let(:gemfile) { bundled_app("Gemfile") }

    before do
      allow(Plugin::DSL).to receive(:new) { builder }
      allow(builder).to receive(:eval_gemfile).with(gemfile)
      allow(builder).to receive(:to_definition) { definition }
      allow(builder).to receive(:inferred_plugins) { [] }
    end

    it "doesn't calls installer without any plugins" 


    context "with dependencies" do
      let(:plugin_specs) do
        {
          "new-plugin" => spec,
          "another-plugin" => spec2,
        }
      end

      before do
        allow(index).to receive(:installed?) { nil }
        allow(definition).to receive(:dependencies) { [Bundler::Dependency.new("new-plugin", ">=0"), Bundler::Dependency.new("another-plugin", ">=0")] }
        allow(installer).to receive(:install_definition) { plugin_specs }
      end

      it "should validate and register the plugins" 


      it "should pass the optional plugins to #register_plugin" 

    end
  end

  describe "#command?" do
    it "returns true value for commands in index" 


    it "returns false value for commands not in index" 

  end

  describe "#exec_command" do
    it "raises UndefinedCommandError when command is not found" 

  end

  describe "#source?" do
    it "returns true value for sources in index" 


    it "returns false value for source not in index" 

  end

  describe "#source" do
    it "raises UnknownSourceError when source is not found" 


    it "loads the plugin, if not loaded" 


    it "returns the class registered with #add_source" 

  end

  describe "#source_from_lock" do
    it "returns instance of registered class initialized with locked opts" 

  end

  describe "#root" do
    context "in app dir" do
      before do
        gemfile ""
      end

      it "returns plugin dir in app .bundle path" 

    end

    context "outside app dir" do
      it "returns plugin dir in global bundle path" 

    end
  end

  describe "#add_hook" do
    it "raises an ArgumentError on an unregistered event" 

  end

  describe "#hook" do
    before do
      path = lib_path("foo-plugin")
      build_lib "foo-plugin", :path => path do |s|
        s.write "plugins.rb", code
      end

      Bundler::Plugin::Events.send(:reset)
      Bundler::Plugin::Events.send(:define, :EVENT_1, "event-1")
      Bundler::Plugin::Events.send(:define, :EVENT_2, "event-2")

      allow(index).to receive(:hook_plugins).with(Bundler::Plugin::Events::EVENT_1).
        and_return(["foo-plugin"])
      allow(index).to receive(:hook_plugins).with(Bundler::Plugin::Events::EVENT_2).
        and_return(["foo-plugin"])
      allow(index).to receive(:plugin_path).with("foo-plugin").and_return(path)
      allow(index).to receive(:load_paths).with("foo-plugin").and_return([])
    end

    let(:code) { <<-RUBY }
      Bundler::Plugin::API.hook("event-1") { puts "hook for event 1" }
    RUBY

    it "raises an ArgumentError on an unregistered event" 


    it "executes the hook" 


    context "single plugin declaring more than one hook" do
      let(:code) { <<-RUBY }
        Bundler::Plugin::API.hook(Bundler::Plugin::Events::EVENT_1) {}
        Bundler::Plugin::API.hook(Bundler::Plugin::Events::EVENT_2) {}
        puts "loaded"
      RUBY

      it "evals plugins.rb once" 

    end

    context "a block is passed" do
      let(:code) { <<-RUBY }
        Bundler::Plugin::API.hook(Bundler::Plugin::Events::EVENT_1) { |&blk| blk.call }
      RUBY

      it "is passed to the hook" 

    end
  end
end

