require 'doublespeak_spec_helper'

module Shoulda::Matchers::Doublespeak
  describe World do
    describe '#double_collection_for' do
      it 'calls DoubleCollection.new once with the given class' 


      it 'returns the created DoubleCollection' 

    end

    describe '#with_doubles_activated' do
      it 'installs all doubles, yields the block, then uninstalls them all' 


      it 'still makes sure to uninstall all doubles even if the block raises an error' 

    end

    def build_double_collection
      double('double_collection', activate: nil, deactivate: nil)
    end
  end
end

