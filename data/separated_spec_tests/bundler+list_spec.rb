# frozen_string_literal: true

RSpec.describe "bundle list", :bundler => "2" do
  before do
    install_gemfile <<-G
      source "file://#{gem_repo1}"

      gem "rack"
      gem "rspec", :group => [:test]
    G
  end

  context "with name-only and paths option" do
    it "raises an error" 

  end

  context "with without-group and only-group option" do
    it "raises an error" 

  end

  describe "with without-group option" do
    context "when group is present" do
      it "prints the gems not in the specified group" 

    end

    context "when group is not found" do
      it "raises an error" 

    end
  end

  describe "with only-group option" do
    context "when group is present" do
      it "prints the gems in the specified group" 

    end

    context "when group is not found" do
      it "raises an error" 

    end
  end

  context "with name-only option" do
    it "prints only the name of the gems in the bundle" 

  end

  context "with paths option" do
    before do
      build_repo2 do
        build_gem "bar"
      end

      build_git "git_test", "1.0.0", :path => lib_path("git_test")

      build_lib("gemspec_test", :path => tmp.join("gemspec_test")) do |s|
        s.write("Gemfile", "source :rubygems\ngemspec")
        s.add_dependency "bar", "=1.0.0"
      end

      install_gemfile <<-G
        source "file://#{gem_repo2}"
        gem "rack"
        gem "rails"
        gem "git_test", :git => "#{lib_path("git_test")}"
        gemspec :path => "#{tmp.join("gemspec_test")}"
      G

      bundle! "install"
    end

    it "prints the path of each gem in the bundle" 

  end

  context "when no gems are in the gemfile" do
    before do
      install_gemfile <<-G
        source "file://#{gem_repo1}"
      G
    end

    it "prints message saying no gems are in the bundle" 

  end

  it "lists gems installed in the bundle" 


  it "aliases the ls command to list" 

end

