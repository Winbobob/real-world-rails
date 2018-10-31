require 'spec_helper'
require 'support/module_context'

def invoke(method)
  if subject == object
    subject.public_send(method)
  else
    subject.public_send(method, object)
  end
end

shared_examples 'stringify_keys!' do
  it 'converts keys to strings' 


  it 'converts nested instances of the same class' 


  it 'converts nested hashes' 


  it 'converts nested arrays' 

end

shared_examples 'stringify_keys' do
  it 'converts keys to strings' 


  it 'does not alter the original' 

end

describe Hashie::Extensions::StringifyKeys do
  include_context 'included hash module'
  let(:object) { subject }

  describe '#stringify_keys!' do
    include_examples 'stringify_keys!'

    it 'returns itself' 

  end

  context 'class methods' do
    subject { described_class }
    let(:object) { Hash.new }

    describe '.stringify_keys' do
      include_examples 'stringify_keys'
    end
    describe '.stringify_keys!' do
      include_examples 'stringify_keys!'
    end
  end

  context 'singleton methods' do
    subject { Hash }
    let(:object) { subject.new.merge(a: 1, b: { c: 2 }).extend(Hashie::Extensions::StringifyKeys) }
    let(:expected_hash) { { 'a' => 1, 'b' => { 'c' => 2 } } }

    describe '.stringify_keys' do
      it 'does not raise error' 

      it 'produces expected stringified hash' 

    end
    describe '.stringify_keys!' do
      it 'does not raise error' 

      it 'produces expected stringified hash' 

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
  let(:object) { Hash.new }

  describe '.stringify_keys' do
    include_examples 'stringify_keys'
  end
  describe '.stringify_keys!' do
    include_examples 'stringify_keys!'
  end
end

