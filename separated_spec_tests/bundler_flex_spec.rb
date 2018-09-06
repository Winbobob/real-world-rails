# frozen_string_literal: true

RSpec.describe "bundle flex_install" do
  it "installs the gems as expected" 


  it "installs even when the lockfile is invalid" 


  it "keeps child dependencies at the same version" 


  describe "adding new gems" do
    it "installs added gems without updating previously installed gems" 


    it "keeps child dependencies pinned" 

  end

  describe "removing gems" do
    it "removes gems without changing the versions of remaining gems" 


    it "removes top level dependencies when removed from the Gemfile while leaving other dependencies intact" 


    it "removes child dependencies" 

  end

  describe "when Gemfile conflicts with lockfile" do
    before(:each) do
      build_repo2
      install_gemfile <<-G
        source "file://#{gem_repo2}"
        gem "rack_middleware"
      G

      expect(the_bundle).to include_gems "rack_middleware 1.0", "rack 0.9.1"

      build_repo2
      update_repo2 do
        build_gem "rack-obama", "2.0" do |s|
          s.add_dependency "rack", "=1.2"
        end
        build_gem "rack_middleware", "2.0" do |s|
          s.add_dependency "rack", ">=1.0"
        end
      end

      gemfile <<-G
        source "file://#{gem_repo2}"
        gem "rack-obama", "2.0"
        gem "rack_middleware"
      G
    end

    it "does not install gems whose dependencies are not met" 


    it "suggests bundle update when the Gemfile requires different versions than the lock" 

  end

  describe "subtler cases" do
    before :each do
      install_gemfile <<-G
        source "file://#{gem_repo1}"
        gem "rack"
        gem "rack-obama"
      G

      gemfile <<-G
        source "file://#{gem_repo1}"
        gem "rack", "0.9.1"
        gem "rack-obama"
      G
    end

    it "does something" 


    it "should work when you update" 

  end

  describe "when adding a new source" do
    it "updates the lockfile", :bundler => "< 2" 


    it "updates the lockfile", :bundler => "2" 

  end

  # This was written to test github issue #636
  describe "when a locked child dependency conflicts" do
    before(:each) do
      build_repo2 do
        build_gem "capybara", "0.3.9" do |s|
          s.add_dependency "rack", ">= 1.0.0"
        end

        build_gem "rack", "1.1.0"
        build_gem "rails", "3.0.0.rc4" do |s|
          s.add_dependency "rack", "~> 1.1.0"
        end

        build_gem "rack", "1.2.1"
        build_gem "rails", "3.0.0" do |s|
          s.add_dependency "rack", "~> 1.2.1"
        end
      end
    end

    it "prints the correct error message" 

  end
end

