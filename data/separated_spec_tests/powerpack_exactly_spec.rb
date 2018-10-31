require 'spec_helper'

unless Enumerable.method_defined? :exactly
  describe 'Enumerable#exactly' do
    context 'with block' do
      it 'returns true for exact number of matches' 


      it 'returns false for less matches' 


      it 'returns false for more matches' 

    end

    context 'without block' do
      it 'returns true for exact number of non nil/false elements in absence of nil/false elements' 


      it 'returns true for exact number of non nil/false elements in presence of nil/false elements' 


      it 'returns true for exact number of nil/false elements' 


      it 'returns false if there are less non nil/false elements in absence of nil/false elements' 


      it 'returns false if there are less non nil/false elements in presence of nil/false elements' 

    end
  end
end

