require "spec_helper"

require "capistrano/scm/git"

module Capistrano
  describe SCM::Git do
    subject { Capistrano::SCM::Git.new }

    # This allows us to easily use `set`, `fetch`, etc. in the examples.
    let(:env) { Capistrano::Configuration.env }

    # Stub the SSHKit backend so we can set up expectations without the plugin
    # actually executing any commands.
    let(:backend) { stub }
    before { SSHKit::Backend.stubs(:current).returns(backend) }

    # Mimic the deploy flow tasks so that the plugin can register its hooks.
    before do
      Rake::Task.define_task("deploy:new_release_path")
      Rake::Task.define_task("deploy:check")
      Rake::Task.define_task("deploy:set_current_revision")
    end

    # Clean up any tasks or variables that the plugin defined.
    after do
      Rake::Task.clear
      Capistrano::Configuration.reset!
    end

    describe "#set_defaults" do
      it "makes git_wrapper_path using application, stage, and local_user" 

    end

    describe "#git" do
      it "should call execute git in the context, with arguments" 

    end

    describe "#repo_mirror_exists?" do
      it "should call test for repo HEAD" 

    end

    describe "#check_repo_is_reachable" do
      it "should test the repo url" 

    end

    describe "#clone_repo" do
      it "should run git clone" 


      it "should run git clone in shallow mode" 


      context "with username and password specified" do
        before do
          env.set(:git_http_username, "hello")
          env.set(:git_http_password, "topsecret")
          env.set(:repo_url, "https://example.com/repo.git")
          env.set(:repo_path, "path")
        end

        it "should include the credentials in the url" 

      end
    end

    describe "#update_mirror" do
      it "should run git update" 


      it "should run git update in shallow mode" 

    end

    describe "#archive_to_release_path" do
      it "should run git archive without a subtree" 


      it "should run git archive with a subtree" 


      it "should run tar with an overridden name" 

    end

    describe "#fetch_revision" do
      it "should capture git rev-list" 

    end
  end
end

