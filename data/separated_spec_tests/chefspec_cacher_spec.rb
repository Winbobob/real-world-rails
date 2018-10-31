require 'spec_helper'
require 'chefspec/cacher'

describe ChefSpec::Cacher do
  let(:klass) do
    Class.new(RSpec::Core::ExampleGroup) do
      extend ChefSpec::Cacher

      def self.metadata
        { parent_example_group: { location: 'spec' } }
      end
    end
  end

  let(:cache) { described_class.class_variable_get(:@@cache) }
  let(:preserve_cache) { false }

  before(:each) { described_class.class_variable_set(:@@cache, {}) unless preserve_cache }

  describe 'cached' do
    it 'lazily defines the results for the cache' 


    it 'adds the item to the cache when called' 


    context 'when multithreaded environment' do
      it 'is thread safe' 

    end

    context 'when example groups are defined by looping' do
      let(:preserve_cache) { true }

      ['first', 'second', 'third'].each do |iteration|
        context "on the #{iteration} iteration" do
          context 'in caching context' do
            cached(:cached_iteration) { iteration }
            it 'caches the iteration for this context' 

          end
        end
      end
    end
  end

  describe 'cached!' do
    it 'loads the value at runtime' 

  end
end

