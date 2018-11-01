require 'spec_helper'

describe Hashie::Clash do
  it 'is able to set an attribute via method_missing' 


  it 'is able to set multiple attributes' 


  it 'converts multiple arguments into an array' 


  it 'is able to use bang notation to create a new Clash on a key' 


  it 'is able to chain onto the new Clash when using bang notation' 


  it 'is able to jump back up to the parent in the chain with #_end!' 


  it 'merges rather than replaces existing keys' 


  it 'is able to replace all of its own keys with #replace' 


  it 'merges multiple bang notation calls' 


  it 'raises an exception when method is missing' 


  describe 'when inherited' do
    subject { Class.new(described_class).new }

    it 'bang nodes are instances of a subclass' 


    it 'merged nodes are instances of a subclass' 

  end
end

