# frozen_string_literal: true

RSpec.describe "bundle install with git sources" do
  describe "when floating on master" do
    before :each do
      build_git "foo" do |s|
        s.executables = "foobar"
      end

      install_gemfile <<-G
        source "file://#{gem_repo1}"
        git "#{lib_path("foo-1.0")}" do
          gem 'foo'
        end
      G
    end

    it "fetches gems" 


    it "caches the git repo", :bundler => "< 2" 


    it "caches the git repo globally" 


    it "caches the evaluated gemspec" 


    it "does not update the git source implicitly" 


    it "sets up git gem executables on the path" 


    it "complains if pinned specs don't exist in the git repo" 


    it "complains with version and platform if pinned specs don't exist in the git repo" 


    it "complains with multiple versions and platforms if pinned specs don't exist in the git repo" 


    it "still works after moving the application directory" 


    it "can still install after moving the application directory" 

  end

  describe "with an empty git block" do
    before do
      build_git "foo"
      gemfile <<-G
        source "file://#{gem_repo1}"
        gem "rack"

        git "#{lib_path("foo-1.0")}" do
          # this page left intentionally blank
        end
      G
    end

    it "does not explode" 

  end

  describe "when specifying a revision" do
    before(:each) do
      build_git "foo"
      @revision = revision_for(lib_path("foo-1.0"))
      update_git "foo"
    end

    it "works" 


    it "works when the revision is a symbol" 


    it "works when the revision is a non-head ref" 


    it "works when the revision is a non-head ref and it was previously downloaded" 


    it "does not download random non-head refs" 

  end

  describe "when specifying a branch" do
    let(:branch) { "branch" }
    let(:repo) { build_git("foo").path }
    before(:each) do
      update_git("foo", :path => repo, :branch => branch)
    end

    it "works" 


    context "when the branch starts with a `#`" do
      let(:branch) { "#149/redirect-url-fragment" }
      it "works" 

    end

    context "when the branch includes quotes" do
      let(:branch) { %('") }
      it "works" 

    end
  end

  describe "when specifying a tag" do
    let(:tag) { "tag" }
    let(:repo) { build_git("foo").path }
    before(:each) do
      update_git("foo", :path => repo, :tag => tag)
    end

    it "works" 


    context "when the tag starts with a `#`" do
      let(:tag) { "#149/redirect-url-fragment" }
      it "works" 

    end

    context "when the tag includes quotes" do
      let(:tag) { %('") }
      it "works" 

    end
  end

  describe "when specifying local override" do
    it "uses the local repository instead of checking a new one out" 


    it "chooses the local repository on runtime" 


    it "unlocks the source when the dependencies have changed while switching to the local" 


    it "updates specs on runtime" 


    it "updates ref on install" 


    it "explodes if given path does not exist on install" 


    it "explodes if branch is not given on install" 


    it "does not explode if disable_local_branch_check is given" 


    it "explodes on different branches on install" 


    it "explodes on invalid revision on install" 

  end

  describe "specified inline" do
    # TODO: Figure out how to write this test so that it is not flaky depending
    #       on the current network situation.
    # it "supports private git URLs" do
    #   gemfile <<-G
    #     gem "thingy", :git => "git@notthere.fallingsnow.net:somebody/thingy.git"
    #   G
    #
    #   bundle :install
    #
    #   # p out
    #   # p err
    #   puts err unless err.empty? # This spec fails randomly every so often
    #   err.should include("notthere.fallingsnow.net")
    #   err.should include("ssh")
    # end

    it "installs from git even if a newer gem is available elsewhere" 


    it "installs dependencies from git even if a newer gem is available elsewhere" 


    it "correctly unlocks when changing to a git source" 


    it "correctly unlocks when changing to a git source without versions" 

  end

  describe "block syntax" do
    it "pulls all gems from a git block" 

  end

  it "uses a ref if specified" 


  it "correctly handles cases with invalid gemspecs" 


  it "runs the gemspec in the context of its parent directory" 


  it "installs from git even if a rubygems gem is present" 


  it "fakes the gem out if there is no gemspec" 


  it "catches git errors and spits out useful output" 


  it "works when the gem path has spaces in it" 


  it "handles repos that have been force-pushed" 


  it "ignores submodules if :submodule is not passed" 


  it "handles repos with submodules" 


  it "handles implicit updates when modifying the source info" 


  it "does not to a remote fetch if the revision is cached locally" 


  it "doesn't blow up if bundle install is run twice in a row" 


  it "prints a friendly error if a file blocks the git repo" 


  it "does not duplicate git gem sources" 


  describe "switching sources" do
    it "doesn't explode when switching Path to Git sources" 


    it "doesn't explode when switching Gem to Git source" 

  end

  describe "bundle install after the remote has been updated" do
    it "installs" 


    it "gives a helpful error message when the remote ref no longer exists" 

  end

  describe "bundle install --deployment with git sources" do
    it "works" 

  end

  describe "gem install hooks" do
    it "runs pre-install hooks" 


    it "runs post-install hooks" 


    it "complains if the install hook fails" 

  end

  context "with an extension" do
    it "installs the extension" 


    it "does not use old extension after ref changes" 


    it "does not prompt to gem install if extension fails" 


    it "does not reinstall the extension", :rubygems => ">= 2.3.0" 


    it "does not reinstall the extension when changing another gem", :rubygems => ">= 2.3.0" 


    it "does reinstall the extension when changing refs", :rubygems => ">= 2.3.0" 

  end

  it "ignores git environment variables" 


  describe "without git installed" do
    it "prints a better error message" 


    it "installs a packaged git gem successfully" 

  end

  describe "when the git source is overridden with a local git repo" do
    before do
      bundle! "config --global local.foo #{lib_path("foo")}"
    end

    describe "and git output is colorized" do
      before do
        File.open("#{ENV["HOME"]}/.gitconfig", "w") do |f|
          f.write("[color]\n\tui = always\n")
        end
      end

      it "installs successfully" 

    end
  end

  context "git sources that include credentials" do
    context "that are username and password" do
      let(:credentials) { "user1:password1" }

      it "does not display the password" 

    end

    context "that is an oauth token" do
      let(:credentials) { "oauth_token" }

      it "displays the oauth scheme but not the oauth token" 

    end
  end
end

