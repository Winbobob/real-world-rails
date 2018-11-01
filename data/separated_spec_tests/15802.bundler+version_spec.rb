# frozen_string_literal: true

RSpec.describe "bundle version" do
  context "with -v" do
    it "outputs the version", :bundler => "< 2" 


    it "outputs the version", :bundler => "2" 

  end

  context "with --version" do
    it "outputs the version", :bundler => "< 2" 


    it "outputs the version", :bundler => "2" 

  end

  context "with version" do
    it "outputs the version with build metadata", :bundler => "< 2" 


    it "outputs the version with build metadata", :bundler => "2" 

  end
end

