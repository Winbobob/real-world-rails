require 'spec_helper'

unless Enumerable.method_defined? :frequencies
  describe 'Enumerable#frequencies' do
    context 'empty collection' do
      it 'evaluates to an empty hash' 

    end

    context 'populated collection' do
      it 'counts the number of ocurrences and returns a hash in the form value => count' 

    end
  end
end

