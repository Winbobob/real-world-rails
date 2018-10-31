# frozen_string_literal: true

RSpec.describe "bundle add" do
  before :each do
    build_repo2 do
      build_gem "foo", "1.1"
      build_gem "foo", "2.0"
      build_gem "baz", "1.2.3"
      build_gem "bar", "0.12.3"
      build_gem "cat", "0.12.3.pre"
      build_gem "dog", "1.1.3.pre"
    end

    install_gemfile <<-G
      source "file://#{gem_repo2}"
      gem "weakling", "~> 0.0.1"
    G
  end

  context "when no gems are specified" do
    it "shows error" 

  end

  describe "without version specified" do
    it "version requirement becomes ~> major.minor.patch when resolved version is < 1.0" 


    it "version requirement becomes ~> major.minor when resolved version is > 1.0" 


    it "version requirement becomes ~> major.minor.patch.pre when resolved version is < 1.0" 


    it "version requirement becomes ~> major.minor.pre when resolved version is > 1.0.pre" 

  end

  describe "with --version" do
    it "adds dependency of specified version and runs install" 


    it "adds multiple version constraints when specified" 

  end

  describe "with --group" do
    it "adds dependency for the specified group" 


    it "adds dependency to more than one group" 

  end

  describe "with --source" do
    it "adds dependency with specified source" 

  end

  describe "with --skip-install" do
    it "adds gem to Gemfile but is not installed" 

  end

  it "using combination of short form options works like long form" 


  it "shows error message when version is not formatted correctly" 


  it "shows error message when gem cannot be found" 


  it "shows error message when source cannot be reached" 


  describe "with --optimistic" do
    it "adds optimistic version" 

  end

  describe "with --strict option" do
    it "adds strict version" 

  end

  describe "with no option" do
    it "adds pessimistic version" 

  end

  describe "with --optimistic and --strict" do
    it "throws error" 

  end

  context "multiple gems" do
    it "adds multiple gems to gemfile" 


    it "throws error if any of the specified gems are present in the gemfile with different version" 

  end

  describe "when a gem is added which is already specified in Gemfile with version" do
    it "shows an error when added with different version requirement" 


    it "shows error when added without version requirements" 

  end

  describe "when a gem is added which is already specified in Gemfile without version" do
    it "shows an error when added with different version requirement" 

  end
end

