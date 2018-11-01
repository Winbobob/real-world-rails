require 'spec_helper'

describe Gitlab::Utils::StrongMemoize do
  let(:klass) do
    struct = Struct.new(:value) do
      def method_name
        strong_memoize(:method_name) do
          trace << value
          value
        end
      end

      def trace
        @trace ||= []
      end
    end

    struct.include(described_class)
    struct
  end

  subject(:object) { klass.new(value) }

  shared_examples 'caching the value' do
    it 'only calls the block once' 


    it 'returns and defines the instance variable for the exact value' 

  end

  describe '#strong_memoize' do
    [nil, false, true, 'value', 0, [0]].each do |value|
      context "with value #{value}" do
        let(:value) { value }

        it_behaves_like 'caching the value'
      end
    end
  end

  describe '#clear_memoization' do
    let(:value) { 'mepmep' }

    it 'removes the instance variable' 

  end
end

