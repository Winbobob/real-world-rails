require 'spec_helper'

unless Enumerable.method_defined? :sum
  describe 'Enumerable#sum' do
    it 'sums up the numbers of an enum' 


    it 'returns zero when invoked on an empty collection' 


    it 'returns the initial value when invoked on an empty collection' 


    it 'prepends the initial value to the sum' 


    it 'concatenates strings' 


    it 'concatenates arrays' 

  end
end

