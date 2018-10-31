require 'spec_helper'

RSpec.describe Hashie::Extensions::Mash::SymbolizeKeys do
  it 'raises an error when included in a class that is not a Mash' 


  it 'symbolizes all keys in the Mash' 


  context 'implicit to_hash on double splat' do
    let(:destructure) { ->(**opts) { opts } }
    let(:my_mash) do
      Class.new(Hashie::Mash) do
        include Hashie::Extensions::Mash::SymbolizeKeys
      end
    end
    let(:instance) { my_mash.new('outer' => { 'inner' => 42 }, 'testing' => [1, 2, 3]) }

    subject { destructure.call(instance) }

    it 'is converted on method calls' 


    it 'is converted on explicit operator call' 

  end
end

