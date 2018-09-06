require 'spec_helper'

unless Enumerable.method_defined? :average
  describe 'Enumerable#average' do
    it 'calculates the average of an enum' 


    it 'calculates the average of an array' 


    it 'returns nil when invoked on an empty collection' 


    it 'returns default value when invoked on an empty collection' 

  end
end

