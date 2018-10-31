require 'rbconfig'

module Concurrent

  require 'concurrent/atomic/thread_local_var'

  RSpec.describe ThreadLocalVar do

    context '#initialize' do

      it 'can set an initial value' 


      it 'sets nil as a default initial value' 


      it 'sets the same initial value for all threads' 


      if Concurrent.on_jruby?
        it 'extends JavaThreadLocalVar' 

      else
        it 'extends RubyThreadLocalVar' 

      end

      it 'can set a block to be called to get the initial value' 


      context 'when attempting to set both an initial value and a block' do
        it do
          expect { described_class.new(14) { 14 } }.to raise_error(ArgumentError)
        end
      end
    end

    context '#value' do
      let(:v) { described_class.new(14) }

      it 'returns the current value' 


      it 'returns the value after modification' 


      context 'when using a block to initialize the value' do
        it 'calls the block to initialize the value' 


        it 'sets the block return value as the current value' 


        it 'calls the block to initialize the value for each thread' 

      end
    end

    context '#value=' do
      let(:v) { described_class.new(14) }

      it 'sets a new value' 


      it 'returns the new value' 


      it 'does not modify the initial value for other threads' 


      it 'does not modify the value for other threads' 

    end
  end
end

