require 'rails_helper'

describe EmailSettingValidator do
  describe '#valid_value?' do
    subject(:validator) { described_class.new }

    it "returns true for blank values" 


    it "returns true if value is a valid email address" 


    it "returns false if value is not a valid email address" 

  end
end

