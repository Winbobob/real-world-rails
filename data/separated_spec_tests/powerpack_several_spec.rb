require 'spec_helper'

unless Enumerable.method_defined? :several
  describe 'Enumerable#several' do
    context 'with block' do
      it 'returns true if more than 1 element matches the predicate' 


      it 'returns false if just 1 element matches the predicate' 


      it 'returns false if no elements match the predicate' 

    end

    context 'without block' do
      it 'returns true if there are 2 or more non nil/false elements' 


      it 'returns false if there are less than 2 non nil/false elements' 

    end
  end
end

