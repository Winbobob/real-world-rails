require 'spec_helper'
require 'active_support/core_ext/hash/indifferent_access'

describe Hashie::Extensions::DeepFind do
  subject { Class.new(Hash) { include Hashie::Extensions::DeepFind } }
  let(:hash) do
    {
      library: {
        books: [
          { title: 'Call of the Wild' },
          { title: 'Moby Dick' }
        ],
        shelves: nil,
        location: {
          address: '123 Library St.',
          title: 'Main Library'
        }
      }
    }
  end
  let(:instance) { subject.new.update(hash) }

  describe '#deep_find' do
    it 'detects a value from a nested hash' 


    it 'detects a value from a nested array' 


    it 'returns nil if it does not find a match' 

  end

  describe '#deep_find_all' do
    it 'detects all values from a nested hash' 


    it 'returns nil if it does not find any matches' 


    context 'when match value is hash itself' do
      let(:hash) do
        {
          title: {
            type: :string
          },
          library: {
            books: [
              { title: 'Call of the Wild' },
              { title: 'Moby Dick' }
            ],
            shelves: nil,
            location: {
              address: '123 Library St.',
              title: 'Main Library'
            }
          }
        }
      end

      it 'detects all values from a nested hash' 

    end
  end

  context 'on an ActiveSupport::HashWithIndifferentAccess' do
    subject(:instance) { hash.with_indifferent_access.extend(Hashie::Extensions::DeepFind) }

    describe '#deep_find' do
      it 'indifferently detects a value from a nested hash' 


      it 'indifferently detects a value from a nested array' 


      it 'indifferently returns nil if it does not find a match' 

    end

    describe '#deep_find_all' do
      it 'indifferently detects all values from a nested hash' 


      it 'indifferently returns nil if it does not find any matches' 

    end
  end

  context 'on a Hash including Hashie::Extensions::IndifferentAccess' do
    let(:klass) { Class.new(Hash) { include Hashie::Extensions::IndifferentAccess } }
    subject(:instance) { klass[hash.dup].extend(Hashie::Extensions::DeepFind) }

    describe '#deep_find' do
      it 'indifferently detects a value from a nested hash' 


      it 'indifferently detects a value from a nested array' 


      it 'indifferently returns nil if it does not find a match' 

    end

    describe '#deep_find_all' do
      it 'indifferently detects all values from a nested hash' 


      it 'indifferently returns nil if it does not find any matches' 

    end
  end
end

