require 'spec_helper'

unless String.method_defined? :blank?
  describe 'String#blank?' do
    it 'returns true for an empty string' 


    it 'returns true for a string with only whitespace in it' 


    it 'returns false for a string with non-whitespace chars in it' 

  end
end
