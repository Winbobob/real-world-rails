require "spec_helper"
require "radiant/task_support"

describe Radiant::TaskSupport do
  describe "self.config_export" do
    before do
      @yaml_file = "#{Rails.root}/tmp/config/radiant_config.yml"
      FileUtils.rm_rf(File.dirname(@yaml_file))
      Radiant::Config['test_data'] = 'test string'
      expect(File.exist?(@yaml_file)).to be false
    end
    it "should create a YAML file in config/radiant_config.yml" 

    it "should create YAML equal to Radiant::Config.to_hash" 

  end
  describe "self.config_import" do
    before do
      @yaml_file = "#{RADIANT_ROOT}/spec/fixtures/radiant_config.yml"
      @bad_yaml_file = "#{RADIANT_ROOT}/spec/fixtures/invalid_config.yml"
    end
    it "should delete all Radiant::Config when the clear parameter is set to true" 

    it "should load from the given YAML path" 

    it "should update Radiant::Config with the settings from the given YAML" 

    it "should roll back if an invalid config setting is imported" 

  end

end

