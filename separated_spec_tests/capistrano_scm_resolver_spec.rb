require "spec_helper"

module Capistrano
  class Configuration
    describe SCMResolver do
      include Capistrano::DSL

      let(:resolver) { SCMResolver.new }

      before do
        Rake::Task.define_task("deploy:check")
        Rake::Task.define_task("deploy:new_release_path")
        Rake::Task.define_task("deploy:set_current_revision")
        set :scm, SCMResolver::DEFAULT_GIT
      end

      after do
        Rake::Task.clear
        Capistrano::Configuration.reset!
      end

      context "default scm, no plugin installed" do
        it "emits a warning" 


        it "activates the git scm" 


        it "sets :scm to :git" 

      end

      context "default scm, git plugin installed" do
        before do
          install_plugin Capistrano::SCM::Git
        end

        it "emits no warning" 


        it "deletes :scm" 

      end
    end
  end
end

