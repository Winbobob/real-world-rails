require "spec_helper"
require "capistrano/doctor/variables_doctor"

module Capistrano
  module Doctor
    describe VariablesDoctor do
      include Capistrano::DSL

      let(:doc) { VariablesDoctor.new }

      before do
        set :branch, "master"
        set :pty, false

        env.variables.untrusted! do
          set :application, "my_app"
          set :repo_tree, "public"
          set :repo_url, ".git"
          set :copy_strategy, :scp
          set :custom_setting, "hello"
          set "string_setting", "hello"
          ask :secret
        end

        fetch :custom_setting
      end

      after { Capistrano::Configuration.reset! }

      it "prints using 4-space indentation" 


      it "prints variable names and values" 


      it "prints unanswered question variable as <ask>" 


      it "prints warning for unrecognized variable" 


      it "does not print warning for unrecognized variable that is fetched" 


      it "does not print warning for whitelisted variable" 


      describe "Rake" do
        before do
          load File.expand_path("../../../../../lib/capistrano/doctor.rb",
                                __FILE__)
        end

        after do
          Rake::Task.clear
        end

        it "has an doctor:variables task that calls VariablesDoctor", capture_io: true do
          VariablesDoctor.any_instance.expects(:call)
          Rake::Task["doctor:variables"].invoke
        end

        it "has a doctor task that depends on doctor:variables" 

      end
    end
  end
end

