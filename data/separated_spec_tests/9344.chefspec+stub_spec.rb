require 'spec_helper'

describe ChefSpec::Stubs::Stub do
  describe '#and_return' do
    subject { described_class.new.and_return('value') }

    it 'sets the value' 


    it 'returns an instance of the stub' 

  end

  describe '#and_raise' do
    subject { described_class.new.and_raise(ArgumentError) }

    it 'sets the block' 


    it 'returns an instance of the stub' 

  end

  describe '#result' do
    context 'when a value is given' do
      subject { described_class.new.and_return('value') }

      it 'returns the value' 

    end

    context 'when a block is given' do
      subject { described_class.new }

      it 'calls the block' 

    end

    context 'when an exception block is given' do
      subject { described_class.new.and_raise(ArgumentError) }

      it 'raises the exception' 

    end

    context 'when the value is a Hash' do
      subject { described_class.new.and_return([ { name: 'a' } ]) }

      it 'recursively mashifies the value' 

    end
  end
end

