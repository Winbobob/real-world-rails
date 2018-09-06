# See https://github.com/dtao/safe_yaml/issues/47

require "spec_helper"

describe YAML do
  context "when you've only required safe_yaml/load", :libraries => true do
    it "YAML.load doesn't get monkey patched" 


    it "YAML.load_file doesn't get monkey patched" 

  end
end

