require 'spec_helper'

unless Numeric.method_defined? :pos?
  describe 'Numeric#pos?' do
    it 'returns true for positive integer' 


    it 'returns true for positive float' 


    it 'returns false for negative integer' 


    it 'returns false for negative float' 


    it 'returns false for 0' 

  end
end

