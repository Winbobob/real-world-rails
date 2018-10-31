require "spec_helper"

describe "credentials" do
  before do
    @old_home = ENV["HOME"]
    @old_rc   = ENV["FOG_RC"]
    @old_credential = ENV["FOG_CREDENTIAL"]
    @old_credentials = Fog.credentials
    Fog.instance_variable_set("@credential_path", nil) # kill memoization
    Fog.instance_variable_set("@credential", nil) # kill memoization
  end

  after do
    ENV["HOME"] = @old_home
    ENV["FOG_RC"] = @old_rc
    ENV["FOG_CREDENTIAL"] = @old_credential
    Fog.credentials = @old_credentials
  end

  describe "credential" do
    it "returns :default for default credentials" 


    it "returns the to_sym of the assigned value" 


    it "can set credentials throught the FOG_CREDENTIAL env va" 

  end

  describe "credentials_path"  do
    it "has FOG_RC takes precedence over HOME" 


    it "properly expands paths" 


    it "falls back to home path if FOG_RC not set" 


    it "ignores home path if it does not exist" 


    it "File.expand_path raises because of non-absolute path" 


    it "returns nil when neither FOG_RC or HOME are set" 

  end

  describe "symbolize_credential?" do
    it "returns false if the value is :headers" 


    it "returns true if the value is not :headers" 

  end
end

