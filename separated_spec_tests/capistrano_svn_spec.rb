require "spec_helper"

require "capistrano/scm/svn"

module Capistrano
  describe SCM::Svn do
    subject { Capistrano::SCM::Svn.new }

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

    describe "#svn" do
      it "should call execute svn in the context, with arguments" 

    end

    describe "#repo_mirror_exists?" do
      it "should call test for repo HEAD" 

    end

    describe "#check_repo_is_reachable" do
      it "should test the repo url" 

    end

    describe "#clone_repo" do
      it "should run svn checkout" 

    end

    describe "#update_mirror" do
      it "should run svn update" 


      context "for specific revision" do
        it "should run svn update" 

      end

      it "should run svn switch if repo_url is changed" 

    end

    describe "#archive_to_release_path" do
      it "should run svn export" 

    end

    describe "#fetch_revision" do
      it "should capture svn version" 

    end
  end
end

