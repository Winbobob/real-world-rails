require 'spec_helper'

module Hashie
  module Extensions
    describe DeepFetch do
      subject { Class.new(Hash) { include Hashie::Extensions::DeepFetch } }
      let(:hash) do
        {
          library: {
            books: [
              { title: 'Call of the Wild' },
              { title: 'Moby Dick' }
            ],
            shelves: nil,
            location: {
              address: '123 Library St.'
            }
          }
        }
      end
      let(:instance) { subject.new.update(hash) }

      describe '#deep_fetch' do
        it 'extracts a value from a nested hash' 


        it 'extracts a value from a nested array' 


        context 'when one of the keys is not present' do
          context 'when a block is provided' do
            it 'returns the value of the block' 

          end

          context 'when a block is not provided' do
            context 'when the nested object is an array' do
              it 'raises an UndefinedPathError' 

            end

            context 'when the nested object is a hash' do
              it 'raises a UndefinedPathError' 

            end

            context 'when the nested object is missing' do
              it 'raises an UndefinedPathError' 

            end

            context 'when the nested object is nil' do
              it 'raises an UndefinedPathError' 

            end
          end
        end
      end
    end
  end
end

