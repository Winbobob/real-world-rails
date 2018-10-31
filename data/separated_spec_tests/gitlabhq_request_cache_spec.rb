require 'spec_helper'

describe Gitlab::Cache::RequestCache do
  let(:klass) do
    Class.new do
      extend Gitlab::Cache::RequestCache

      attr_accessor :id, :name, :result, :extra

      def self.name
        'ExpensiveAlgorithm'
      end

      def initialize(id, name, result, extra = nil)
        self.id = id
        self.name = name
        self.result = result
        self.extra = nil
      end

      request_cache def compute(arg)
        result << arg
      end

      request_cache def repute(arg)
        result << arg
      end

      def dispute(arg)
        result << arg
      end
      request_cache(:dispute) { extra }
    end
  end

  let(:algorithm) { klass.new('id', 'name', []) }

  shared_examples 'cache for the same instance' do
    it 'does not compute twice for the same argument' 


    it 'computes twice for the different argument' 


    it 'computes twice for the different class name' 


    it 'computes twice for the different method' 


    context 'when request_cache_key is provided' do
      before do
        klass.request_cache_key do
          [id, name]
        end
      end

      it 'computes twice for the different keys, id' 


      it 'computes twice for the different keys, name' 


      it 'uses extra method cache key if provided' 

    end
  end

  context 'when RequestStore is active', :request_store do
    it_behaves_like 'cache for the same instance'

    it 'computes once for different instances when keys are the same' 


    it 'computes twice if RequestStore starts over' 

  end

  context 'when RequestStore is inactive' do
    it_behaves_like 'cache for the same instance'

    it 'computes twice for different instances even if keys are the same' 

  end
end

