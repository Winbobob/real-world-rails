require 'rails_helper'

describe RegexSettingValidator do
  describe '#valid_value?' do
    subject(:validator) { described_class.new }

    it "returns true for blank values" 


    it "return false for invalid regex" 


    it "returns false for regex with dangerous matches" 


    it "returns true for safe regex" 

  end
end

