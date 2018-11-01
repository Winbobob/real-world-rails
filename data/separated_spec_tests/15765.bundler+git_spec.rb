# frozen_string_literal: true

RSpec.describe "bundle update" do
  describe "git sources" do
    it "floats on a branch when :branch is used" 


    it "updates correctly when you have like craziness" 


    it "floats on a branch when :branch is used and the source is specified in the update" 


    it "floats on master when updating all gems that are pinned to the source even if you have child dependencies" 


    it "notices when you change the repo url in the Gemfile" 


    it "fetches tags from the remote" 


    describe "with submodules" do
      before :each do
        build_repo4 do
          build_gem "submodule" do |s|
            s.write "lib/submodule.rb", "puts 'GEM'"
          end
        end

        build_git "submodule", "1.0" do |s|
          s.write "lib/submodule.rb", "puts 'GIT'"
        end

        build_git "has_submodule", "1.0" do |s|
          s.add_dependency "submodule"
        end

        Dir.chdir(lib_path("has_submodule-1.0")) do
          sys_exec "git submodule add #{lib_path("submodule-1.0")} submodule-1.0"
          `git commit -m "submodulator"`
        end
      end

      it "it unlocks the source when submodules are added to a git source" 


      it "unlocks the source when submodules are removed from git source", :git => ">= 2.9.0" 

    end

    it "errors with a message when the .git repo is gone" 


    it "should not explode on invalid revision on update of gem by name" 


    it "shows the previous version of the gem" 

  end

  describe "with --source flag" do
    before :each do
      build_repo2
      @git = build_git "foo", :path => lib_path("foo") do |s|
        s.executables = "foobar"
      end

      install_gemfile <<-G
        source "file://#{gem_repo2}"
        git "#{lib_path("foo")}" do
          gem 'foo'
        end
        gem 'rack'
      G
    end

    it "updates the source" 


    it "unlocks gems that were originally pulled in by the source" 


    it "leaves all other gems frozen" 

  end

  context "when the gem and the repository have different names" do
    before :each do
      build_repo2
      @git = build_git "foo", :path => lib_path("bar")

      install_gemfile <<-G
        source "file://localhost#{gem_repo2}"
        git "#{lib_path("bar")}" do
          gem 'foo'
        end
        gem 'rack'
      G
    end

    it "the --source flag updates version of gems that were originally pulled in by the source", :bundler => "< 2" 


    it "the --source flag updates version of gems that were originally pulled in by the source", :bundler => "2" 

  end
end

