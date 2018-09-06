require_relative '../../../spec_helper'

module Seahorse
  module Client
    module Http
      describe Headers do

        let(:headers) { Headers.new }

        it 'provides indifferent access to symbolized keys' 


        it 'provides indifferent access to string keys' 


        it 'provides case-insenitive access to keys' 


        it 'stringifies values' 


        it 'can be seeded by the constructor' 


        describe '#to_hash' do

          it 'returns a regular hash' 


          it 'is aliased as #to_h' 


          it 'returns a new hash that protects internal state' 


        end

        describe '#update' do

          it 'accepts a hash, updating self' 


        end

        describe '#each' do

          it 'is enumerable' 


          it 'returns nil if a block is given' 


          it 'returns an Enumerator if a block is not given' 


          it 'yields headers keys and values' 


          it 'is aliased as #each_pair' 


        end

        describe '#delete' do

          it 'deletes a header by key' 


          it 'deletes header with a symbol key' 


          it 'deletes headers ignoring case' 


        end

        describe '#keys' do

          it 'returns the keys' 


        end

        describe '#values' do

          it 'returns the values' 


        end

        describe '#values_at' do

          it 'returns the values for the given keys' 


        end

        describe '#key?' do

          it 'returns true if the header has been set' 


          it 'treats symbols indifferently' 


          it 'treats strings case insensitively' 


          it 'returns false if the header has not been set' 


          it 'is aliased as #has_key?' 


          it 'is aliased as #include?' 


        end

        describe '#inspect' do

          it 'inspects like a normal hash' 


        end
      end
    end
  end
end

