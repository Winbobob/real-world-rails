# frozen_string_literal: true

RSpec.describe "Bundler.load" do
  describe "with a gemfile" do
    before(:each) do
      install_gemfile! <<-G
        source "file://#{gem_repo1}"
        gem "rack"
      G
    end

    it "provides a list of the env dependencies" 


    it "provides a list of the resolved gems" 


    it "ignores blank BUNDLE_GEMFILEs" 

  end

  describe "with a gems.rb file" do
    before(:each) do
      create_file "gems.rb", <<-G
        source "file://#{gem_repo1}"
        gem "rack"
      G
      bundle! :install
    end

    it "provides a list of the env dependencies" 


    it "provides a list of the resolved gems" 

  end

  describe "without a gemfile" do
    it "raises an exception if the default gemfile is not found" 


    it "raises an exception if a specified gemfile is not found" 


    it "does not find a Gemfile above the testing directory" 

  end

  describe "when called twice" do
    it "doesn't try to load the runtime twice" 

  end

  describe "not hurting brittle rubygems" do
    it "does not inject #source into the generated YAML of the gem specs" 

  end
end

