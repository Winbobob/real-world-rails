require_relative 'concern/observable_shared'

module Concurrent

  RSpec.describe Atom do

    context 'construction' do

      it 'sets the initial value to the given value' 

    end

    context '#compare_and_set' do

      it 'sets the new value if the current value matches' 


      it 'returns true if the current value matches' 


      it 'rejects the new value if the current value does not match' 


      it 'returns false if the current value does not match' 


      it 'rejects the new value if the validator returns false' 


      it 'rejects the new value if the validator raises an exception' 


      it 'returns false if the validator returns false' 


      it 'returns false if the validator raises an exception' 

    end

    context '#swap' do

      it 'raises an exception when no block is given' 


      it 'passes the current value to the block' 


      it 'passes all arguments to the block' 


      it 'sets the new value to the result of the block' 


      it 'rejects the new value if the validator returns false' 


      it 'rejects the new value if the validator raises an exception' 


      it 'returns the new value on success' 


      it 'returns the old value if the validator returns false' 


      it 'returns the old value if the validator raises an exception' 


      it 'calls the block more than once if the value changes underneath' 


      it 'reraises the exception from block' 

    end

    context '#reset' do

      it 'sets the new value' 


      it 'returns the new value on success' 


      it 'returns the new value on success' 


      it 'returns the old value if the validator returns false' 


      it 'returns the old value if the validator raises an exception' 

    end

    context :observable do

      subject { Atom.new(0) }

      def trigger_observable(observable)
        observable.reset(42)
      end

      it_behaves_like :observable
    end
  end
end

