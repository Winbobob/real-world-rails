# frozen_string_literal: true

RSpec.describe "bundle install with ENV conditionals" do
  describe "when just setting an ENV key as a string" do
    before :each do
      gemfile <<-G
        source "file://#{gem_repo1}"

        env "BUNDLER_TEST" do
          gem "rack"
        end
      G
    end

    it "excludes the gems when the ENV variable is not set" 


    it "includes the gems when the ENV variable is set" 

  end

  describe "when just setting an ENV key as a symbol" do
    before :each do
      gemfile <<-G
        source "file://#{gem_repo1}"

        env :BUNDLER_TEST do
          gem "rack"
        end
      G
    end

    it "excludes the gems when the ENV variable is not set" 


    it "includes the gems when the ENV variable is set" 

  end

  describe "when setting a string to match the env" do
    before :each do
      gemfile <<-G
        source "file://#{gem_repo1}"

        env "BUNDLER_TEST" => "foo" do
          gem "rack"
        end
      G
    end

    it "excludes the gems when the ENV variable is not set" 


    it "excludes the gems when the ENV variable is set but does not match the condition" 


    it "includes the gems when the ENV variable is set and matches the condition" 

  end

  describe "when setting a regex to match the env" do
    before :each do
      gemfile <<-G
        source "file://#{gem_repo1}"

        env "BUNDLER_TEST" => /foo/ do
          gem "rack"
        end
      G
    end

    it "excludes the gems when the ENV variable is not set" 


    it "excludes the gems when the ENV variable is set but does not match the condition" 


    it "includes the gems when the ENV variable is set and matches the condition" 

  end
end

