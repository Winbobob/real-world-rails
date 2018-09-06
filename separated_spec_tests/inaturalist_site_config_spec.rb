require "spec_helper"

describe SiteConfig do

  before :all do
    @config_path = File.join(Rails.root, "config", "config.yml")
    @example_config_path = File.join(Rails.root, "config", "config.yml.example")
  end

  it "loads config.yml by default" 


  it "falls back to loading config.yml.example" 


  it "raises an error if the config is blank" 


  it "raises an error if the environment isn't configured" 


end

