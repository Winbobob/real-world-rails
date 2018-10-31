# frozen_string_literal: true

RSpec.describe "bundle_ruby", :bundler => "< 2" do
  context "without patchlevel" do
    it "returns the ruby version" 


    it "engine defaults to MRI" 


    it "handles jruby" 


    it "handles rbx" 


    it "handles truffleruby", :rubygems => ">= 2.1.0" 


    it "raises an error if engine is used but engine version is not" 


    it "raises an error if engine_version is used but engine is not" 


    it "raises an error if engine version doesn't match ruby version for MRI" 


    it "should print if no ruby version is specified" 

  end

  context "when using patchlevel" do
    it "returns the ruby version" 


    it "handles an engine" 

  end
end

