require "spec_helper"

require "capistrano/scm/hg"

module Capistrano
  describe SCM::Hg do
    subject { Capistrano::SCM::Hg.new }

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

    describe "#hg" do
      it "should call execute hg in the context, with arguments" 

    end

    describe "#repo_mirror_exists?" do
      it "should call test for repo HEAD" 

    end

    describe "#check_repo_is_reachable" do
      it "should test the repo url" 

    end

    describe "#clone_repo" do
      it "should run hg clone" 

    end

    describe "#update_mirror" do
      it "should run hg update" 

    end

    describe "#archive_to_release_path" do
      it "should run hg archive without a subtree" 


      it "should run hg archive with a subtree" 

    end

    describe "#fetch_revision" do
      it "should capture hg log" 

    end
  end
end

