module Concurrent

  RSpec.describe Async do

    let(:async_class) do
      Class.new do
        include Concurrent::Async
        attr_accessor :accessor
        def initialize(*args)
        end
        def echo(msg)
          msg
        end
        def gather(first, second = nil)
          return first, second
        end
        def boom(ex = StandardError.new)
          raise ex
        end
        def wait(seconds)
          sleep(seconds)
        end
        def with_block
          yield
        end
      end
    end

    subject do
      async_class.new
    end

    context 'object creation' do

      it 'delegates to the original constructor' 


      specify 'passes all args to the original constructor' do
        clazz = Class.new do
          include Concurrent::Async
          attr_reader :args
          def initialize(*args)
            @args = args
          end
        end

        object = clazz.new(:foo, :bar)
        expect(object.args).to eq [:foo, :bar]
      end

      specify 'passes a given block to the original constructor' do
        clazz = Class.new do
          include Concurrent::Async
          attr_reader :block
          def initialize(&block)
            @block = yield
          end
        end

        object = clazz.new{ 42 }
        expect(object.block).to eq 42
      end

      specify 'initializes synchronization' do
        mock = async_class.new
        allow(async_class).to receive(:original_new).and_return(mock)
        expect(mock).to receive(:init_synchronization).once.with(no_args)
        async_class.new
      end
    end

    context '#validate_argc' do

      subject do
        Class.new {
          def zero() nil; end
          def three(a, b, c, &block) nil; end
          def two_plus_two(a, b, c=nil, d=nil, &block) nil; end
          def many(*args, &block) nil; end
        }.new
      end

      it 'raises an exception when the method is not defined' 


      it 'raises an exception for too many args on a zero arity method' 


      it 'does not raise an exception for correct zero arity' 


      it 'raises an exception for too many args on a method with positive arity' 


      it 'raises an exception for too few args on a method with positive arity' 


      it 'does not raise an exception for correct positive arity' 


      it 'raises an exception for too few args on a method with negative arity' 


      it 'does not raise an exception for correct negative arity' 

    end

    context '#async' do

      it 'raises an error when calling a method that does not exist' 


      it 'raises an error when passing too few arguments' 


      it 'raises an error when pasing too many arguments (arity >= 0)' 


      it 'returns a :pending IVar' 


      it 'runs the future on the global executor' 


      it 'sets the value on success' 


      it 'sets the reason on failure' 


      it 'sets the reason when giving too many optional arguments' 


      it 'supports attribute accessors' 


      it 'supports methods with blocks' 

    end

    context '#await' do

      it 'raises an error when calling a method that does not exist' 


      it 'raises an error when passing too few arguments' 


      it 'raises an error when pasing too many arguments (arity >= 0)' 


      it 'returns a :fulfilled IVar' 


      it 'runs the future on the global executor' 


      it 'sets the value on success' 


      it 'sets the reason on failure' 


      it 'sets the reason when giving too many optional arguments' 


      it 'supports attribute accessors' 


      it 'supports methods with blocks' 

    end

    context 'locking' do

      it 'uses the same lock for both #async and #await' 

    end
  end
end

