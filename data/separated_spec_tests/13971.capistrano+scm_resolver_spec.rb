require "spec_helper"
require "capistrano/scm"

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


        it "activates the git scm", capture_io: true do
          resolver.resolve
          expect(Rake::Task["git:wrapper"]).not_to be_nil
        end

        it "sets :scm to :git", capture_io: true do
          resolver.resolve
          expect(fetch(:scm)).to eq(:git)
        end
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

