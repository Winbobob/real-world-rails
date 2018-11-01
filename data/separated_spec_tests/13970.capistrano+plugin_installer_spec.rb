require "spec_helper"
require "capistrano/plugin"
require "capistrano/scm/plugin"

module Capistrano
  class Configuration
    class ExamplePlugin < Capistrano::Plugin
      def set_defaults
        set_if_empty :example_variable, "foo"
      end

      def define_tasks
        task :example
        task :example_prerequisite
      end

      def register_hooks
        before :example, :example_prerequisite
      end
    end

    class ExampleSCMPlugin < Capistrano::SCM::Plugin
    end

    describe PluginInstaller do
      include Capistrano::DSL

      let(:installer) { PluginInstaller.new }
      let(:options) { {} }
      let(:plugin) { ExamplePlugin.new }

      before do
        installer.install(plugin, **options)
      end

      after do
        Rake::Task.clear
        Capistrano::Configuration.reset!
      end

      context "installing plugin" do
        it "defines tasks" 


        it "registers hooks" 


        it "sets defaults when load:defaults is invoked", capture_io: true do
          expect(fetch(:example_variable)).to be_nil
          invoke "load:defaults"
          expect(fetch(:example_variable)).to eq("foo")
        end

        it "doesn't say an SCM is installed" 

      end

      context "installing plugin class" do
        let(:plugin) { ExamplePlugin }

        it "defines tasks" 

      end

      context "installing plugin without hooks" do
        let(:options) { { load_hooks: false } }

        it "doesn't register hooks" 

      end

      context "installing plugin and loading immediately" do
        let(:options) { { load_immediately: true } }

        it "sets defaults immediately" 

      end

      context "installing an SCM plugin" do
        let(:plugin) { ExampleSCMPlugin }

        it "says an SCM is installed" 

      end
    end
  end
end

