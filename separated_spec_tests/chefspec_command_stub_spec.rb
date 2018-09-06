require 'spec_helper'

describe ChefSpec::Stubs::CommandStub do
  describe '#initialize' do
    it 'sets the command and block' 

  end

  describe '#and_return' do
    subject { described_class.new('command').and_return('value') }

    it 'sets the value' 


    it 'returns an instance of the stub' 

  end

  describe '#result' do
    context 'when a value is given' do
      subject { described_class.new('command').and_return('value') }

      it 'returns the value' 

    end

    context 'when a block is given' do
      subject { described_class.new('command') { 1 == 2 } }

      it 'calls the block' 

    end
  end

  describe '#signature' do
    context 'when a value is given' do
      subject { described_class.new('command').and_return(false) }

      it 'includes the value' 

    end

    context 'when a block is given' do
      subject { described_class.new('command') { 1 == 2 } }

      it 'includes a comment about the block' 

    end
  end
end

