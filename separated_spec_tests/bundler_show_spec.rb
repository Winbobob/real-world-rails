# frozen_string_literal: true

RSpec.describe "bundle show", :bundler => "< 2" do
  context "with a standard Gemfile" do
    before :each do
      install_gemfile <<-G
        source "file://#{gem_repo1}"
        gem "rails"
      G
    end

    it "creates a Gemfile.lock if one did not exist" 


    it "creates a Gemfile.lock when invoked with a gem name" 


    it "prints path if gem exists in bundle" 


    it "warns if path no longer exists on disk" 


    it "prints the path to the running bundler" 


    it "complains if gem not in bundle" 


    it "prints path of all gems in bundle sorted by name" 


    it "prints summary of gems" 

  end

  context "with a git repo in the Gemfile" do
    before :each do
      @git = build_git "foo", "1.0"
    end

    it "prints out git info" 


    it "prints out branch names other than master" 


    it "doesn't print the branch when tied to a ref" 


    it "handles when a version is a '-' prerelease", :rubygems => "2.1" 

  end

  context "in a fresh gem in a blank git repo" do
    before :each do
      build_git "foo", :path => lib_path("foo")
      in_app_root_custom lib_path("foo")
      File.open("Gemfile", "w") {|f| f.puts "gemspec" }
      sys_exec "rm -rf .git && git init"
    end

    it "does not output git errors" 

  end

  it "performs an automatic bundle install" 


  context "with an invalid regexp for gem name" do
    it "does not find the gem" 

  end

  context "--outdated option" do
    # Regression test for https://github.com/bundler/bundler/issues/5375
    before do
      build_repo2
    end

    it "doesn't update gems to newer versions" 

  end
end

