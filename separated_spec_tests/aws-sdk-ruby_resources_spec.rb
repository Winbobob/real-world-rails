require_relative '../spec_helper'

describe 'Interfaces' do

  before(:all) do
    # TODO : support Aws.config[:sample] = { ... }
    @tmpdir = SpecHelper.generate_service(['Sample'], multiple_files: true)
  end

  after(:all) do
    SpecHelper.cleanup_service(@tmpdir)
  end

  let(:client) { Sample::Client.new(stub_responses: true) }

  describe 'Resource Interfaces' do

    describe 'Service ::Resource Class' do

      describe '#client' do

        it 'constructs a default client' 


        it 'constructs a client using options given' 


        it 'accepts a client' 


      end

      describe 'actions' do

        it 'supports actions returning a client response' 


        it 'supports actions returning another resource' 


        it 'supports actions returning a list of resources' 


      end

      describe 'has associations' do

        it 'supports has associations with identifier given as input' 


        it 'supports has associations without input' 


        it 'supports nullable associations that return nil' 


        it 'supports nullable associations that return a value' 


      end

      describe 'hasMany associations' do

        it 'returns a collection without making an API call' 


        it 'enumerates response pages when enumerating the collection' 


        it 'supports operations that are not paginated' 


      end
    end
  end

  describe 'Resource Classes' do

    it 'defines a class for each resource type' 


    describe '#initialize' do

      it 'accepts identifiers as positional arguments' 


      it 'accepts identifiers as keyword arguments' 


      it 'aliases identifiers when present in data' 


      it 'supports resources with numeric identifiers' 


      it 'raises an ArgumentError when an identifier is missing' 


      it 'supports a resource that has no identifiers' 


    end

    describe '#client' do

      it 'constructs an instance of Client by default' 


      it 'constructs a client from options' 


      it 'passes extra options to the client constructor' 


      it 'accepts a client option' 


    end

    describe '#load, #reload, #data, #data_loaded? methods' do

      describe 'shape and load' do

        it '#load hydrates the resource' 


        it '#data loads the resource only once returning the cached data' 


        it '#data_loaded? returns false until loaded' 


        it 'uses data as provided to the constructor' 


        it 'allows data to be provided as hash' 


      end

      describe 'shape without load' do

        it '#load raises an error' 


        it '#data returns the shape when present' 


        it '#data raises an error when shape not present' 


        it '#data_loaded? returns true if data is present' 


      end

      describe 'no shape' do

        it '#load raises an error' 


        it '#data returns an empty shape' 


        it '#data_loaded? returns true' 


      end
    end

    describe 'attributes' do

      it 'defines a read-only method for each identifier' 


      it 'defines a read-only method for each data shape member' 


      # deprecated method
      it 'returns all identifiers as a hash' 


    end

    describe '#exists?' do

      it 'does not responds to #exists? if there is no Exists waiter' 


      it 'responds to #exists? if there is an Exists waiter' 


      it 'polls the waiter once and returns the result' 


      it 'raises unexpected errors' 


    end

    describe 'actions' do

      it 'supports actions returning a client response' 


      it 'supports actions returning another resource' 


      it 'supports actions returning a list of resources' 


      it 'supports actions that construct a batch from request params' 


    end

    describe 'has associations' do

      it 'supports has associations with identifier given as input' 


      it 'supports has associations without input' 


      it 'supports plural has associations' 


    end

    describe 'hasMany associations' do

      it 'returns a collection without making an API call' 


      it 'enumerates response pages when enumerating the collection' 


      it 'supports complex filters' 


      it 'supports complex filters' 


      it 'deep merges incoming params with fixed params' 


    end

    describe 'waiters' do

      it 'has default #wait_until method' 


      it 'defines a single #wait_until_* method for each named waiter' 


      it 'invokes the appropriate waiter' 


      it 'accepts configuration options' 


      it 'passes through params to the client waiter method' 


      it 'returns a new hydrated resource if path is given' 


      it 'returns a new unhydrated resource if path is not given' 


    end

    describe 'batchActions' do

      it 'raises for actions that model a resource' 


      it 'invokes one client request per collection batch and returns nil as response' 


      it 'auto-populate identifiers with list of strings' 


      it 'has a #batches method that returns a collection enumerator that responds to batch actions' 


      it 'validates batch args, options must be a hash' 


    end
  end
end

