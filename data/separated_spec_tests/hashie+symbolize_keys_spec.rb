require 'spec_helper'
require 'support/module_context'

def invoke(method)
  if subject == object
    subject.public_send(method)
  else
    subject.public_send(method, object)
  end
end

shared_examples 'symbolize_keys!' do
  it 'converts keys to symbols' 


  it 'converts nested instances of the same class' 


  it 'converts nested hashes' 


  it 'performs deep conversion within nested arrays' 

end

shared_examples 'symbolize_keys' do
  it 'converts keys to symbols' 


  it 'does not alter the original' 

end

describe Hashie::Extensions::SymbolizeKeys do
  include_context 'included hash module'
  let(:object) { subject }

  describe '#symbolize_keys!' do
    include_examples 'symbolize_keys!'
    let(:object) { subject }

    it 'returns itself' 

  end

  describe '#symbolize_keys' do
    include_examples 'symbolize_keys'
  end

  context 'class methods' do
    subject { described_class }
    let(:object) { {} }

    describe '.symbolize_keys' do
      include_examples 'symbolize_keys'
    end
    describe '.symbolize_keys!' do
      include_examples 'symbolize_keys!'
    end
  end

  context 'singleton methods' do
    subject { Hash }
    let(:object) do
      subject.new.merge('a' => 1, 'b' => { 'c' => 2 }).extend(Hashie::Extensions::SymbolizeKeys)
    end
    let(:expected_hash) { { a: 1, b: { c: 2 } } }

    describe '.symbolize_keys' do
      it 'does not raise error' 

      it 'produces expected symbolized hash' 

    end
    describe '.symbolize_keys!' do
      it 'does not raise error' 

      it 'produces expected symbolized hash' 

    end
  end
end

describe Hashie do
  let!(:dummy_class) do
    klass = Class.new(::Hash)
    klass.send :include, Hashie::Extensions::StringifyKeys
    klass
  end

  subject { described_class }
  let(:object) { {} }

  describe '.symbolize_keys' do
    include_examples 'symbolize_keys'
  end
  describe '.symbolize_keys!' do
    include_examples 'symbolize_keys!'
  end
end

