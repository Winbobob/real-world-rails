require_relative '../../spec_helper'

module Seahorse
  module Client
    describe HandlerList do

      let(:handlers) { HandlerList.new }

      it 'is enumerable' 


      describe '#add' do

        it 'adds a handler' 


        it 'handlers added first have a higher priority' 


        it 'returns the handler class' 


        describe ':step' do

          it 'sorts handlers by step priority order' 


          it 'defaults step to :build' 


          it 'accepts multiple handlers with the same step' 


        end

        describe ':priority' do

          it 'accepts a priority' 


          it 'sorts handler with the same priority in FIFO order' 


        end

        describe 'errors' do

          it 'raises an error if :step is not valid' 


          it 'raises an error if :priority is less than 0' 


          it 'raises an error if :priority is greater than 99' 


        end

        describe ':step => :send' do

          it 'only keeps the latest send handler' 


          it 'ignores :priority when adding :send handlers' 


        end

        describe ':operations' do

          it 'adds a handler that is not enumerated by default' 


          it 'adds a handler that is enumerated for a given :operation' 


          it 'does not add handlers when operation list is empty' 


          it 'does add handlers when operation list is nil' 


        end

      end

      describe '#copy_from' do

        it 'copies handlers from one list to another' 


        it 'accepts a block to skip handlers when the block returns false' 


      end

      describe '#for' do

        it 'returns a handler list' 


        it 'returns a different handler list' 


        it 'copies the send handler' 


        it 'copies the common handlers' 


        it 'deep copies handlers' 


        it 'copies operation handlers with the given name' 


        it 'does not copy operation handlers that have a different name' 


        it 'merges operation and common handlers preserving priority' 


        it 'accpets operation names as symbols' 


      end

      describe '#to_stack' do

        it 'constructs a handler stack' 


      end
    end
  end
end

