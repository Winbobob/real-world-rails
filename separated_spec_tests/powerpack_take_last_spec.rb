require 'spec_helper'

unless Enumerable.method_defined? :take_last
  describe 'Enumerable#take_last' do
    it 'takes the last n elements' 


    it 'returns everything if you request to drop too many elems' 


    it 'does not accept negative argument' 

  end
end
