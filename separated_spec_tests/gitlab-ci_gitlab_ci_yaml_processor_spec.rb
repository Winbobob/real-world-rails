require 'spec_helper'

describe GitlabCiYamlProcessor do
  
  describe "#builds_for_ref" do
    let (:type) { 'test' }

    it "returns builds if no branch specified" 


    it "does not return builds if only has another branch" 


    it "does not return builds if only has regexp with another branch" 


    it "returns builds if only has specified this branch" 


    it "does not build tags" 


    it "returns builds if only has a list of branches including specified" 


    it "returns build only for specified type" 

  end

  describe "Image and service handling" do
    it "returns image and service when defined" 


    it "returns image and service when overridden for job" 

  end

  describe "Variables" do
    it "returns variables when defined" 

  end

  describe "Error handling" do
    it "indicates that object is invalid" 


    it "returns errors if tags parameter is invalid" 


    it "returns errors if before_script parameter is invalid" 


    it "returns errors if image parameter is invalid" 


    it "returns errors if job image parameter is invalid" 


    it "returns errors if services parameter is not an array" 


    it "returns errors if services parameter is not an array of strings" 


    it "returns errors if job services parameter is not an array" 


    it "returns errors if job services parameter is not an array of strings" 


    it "returns errors if there are unknown parameters" 


    it "returns errors if there are unknown parameters that are hashes, but doesn't have a script" 


    it "returns errors if there is no any jobs defined" 


    it "returns errors if job allow_failure parameter is not an boolean" 


    it "returns errors if job stage is not a string" 


    it "returns errors if job stage is not a pre-defined stage" 


    it "returns errors if job stage is not a defined stage" 


    it "returns errors if stages is not an array" 


    it "returns errors if stages is not an array of strings" 


    it "returns errors if variables is not a map" 


    it "returns errors if variables is not a map of key-valued strings" 

  end
end

