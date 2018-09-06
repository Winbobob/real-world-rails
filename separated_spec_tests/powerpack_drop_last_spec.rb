require 'spec_helper'

unless Enumerable.method_defined? :drop_last
  describe 'Enumerable#drop_last' do
    it 'drops the last n elements' 


    it 'returns an empty array if you request to drop too many elems' 


    it 'does not accept negative argument' 

  end
end

