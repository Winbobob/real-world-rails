require 'spec_helper'

describe Hash do
  it 'is convertible to a Hashie::Mash' 


  it '#stringify_keys! turns all keys into strings' 


  it '#stringify_keys! turns all keys into strings recursively' 


  it '#stringify_keys returns a hash with stringified keys' 


  it '#to_hash returns a hash with same keys' 


  it '#to_hash with stringify_keys set to true returns a hash with stringified_keys' 


  it '#to_hash with symbolize_keys set to true returns a hash with symbolized keys' 


  it "#to_hash should not blow up when #to_hash doesn't accept arguments" 


  describe 'when the value is an object that respond_to to_hash' do
    class ClassRespondsToHash
      def to_hash(options = {})
        Hashie::Hash['a' => 'hey', b: 'bar', 123 => 'bob', 'array' => [1, 2, 3]].to_hash(options)
      end
    end

    it '#to_hash returns a hash with same keys' 


    it '#to_hash with stringify_keys set to true returns a hash with stringified_keys' 


    it '#to_hash with symbolize_keys set to true returns a hash with symbolized keys' 

  end
end

