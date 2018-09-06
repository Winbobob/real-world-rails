require 'spec_helper'

unless Numeric.method_defined? :neg?
  describe 'Numeric#neg?' do
    it 'returns false for positive integer' 


    it 'returns false for positive float' 


    it 'returns true for negative integer' 


    it 'returns true for negative float' 


    it 'returns false for 0' 

  end
end

