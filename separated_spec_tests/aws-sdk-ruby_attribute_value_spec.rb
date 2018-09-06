require_relative 'spec_helper'
require 'bigdecimal'
require 'set'

module Aws
  module DynamoDB
    describe AttributeValue do

      let(:value) { AttributeValue.new }

      describe '#marshal' do

        it 'converts hashes to :m (map)' 


        it 'converts arrays to :l (list)' 


        it 'converts IO objects to :b (binary)' 


        it 'converts string sets to :ss (string set)' 


        it 'converts symbol sets to :ss (string set)' 


        it 'converts empty sets to :es (empty set)' 


        it 'converts objects sets responding to #to_str to :ss (string set)' 


        it 'converts numeric sets to :ns (number set)' 


        it 'converts binary sets to :bs (binary set)' 


        it 'converts numerics to :n (number)' 


        it 'converts strings to :s' 


        it 'converts symbol to :s' 


        it 'converts objects responding to #to_str to :s' 


        it 'converts booleans :bool' 


        it 'converts nil to :null' 


        it 'recursively converted mixed types' 


        it 'raises an argument error for unhandled types' 


      end

      describe '#unmarshal' do

        it 'converts :m to a hash with string keys (not symbols)' 


        it 'converts :l to an array' 


        it 'converts :ss to a set of strings' 


        it 'converts :ns to a set of big decimals (to preserve precision)' 


        it 'converts :bs to a set of binary values' 


        it 'converts :es to an empty set' 


        it 'converts :n to big decimals' 


        it 'converts :s to a string' 


        it 'converts :bool to booleans true or false' 


        it 'converts :null to nil' 


        it 'recursively converted mixed types' 


        it 'raises an argument error for unhandled types' 


      end
    end
  end
end

