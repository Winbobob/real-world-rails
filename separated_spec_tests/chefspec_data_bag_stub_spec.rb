require 'spec_helper'

describe ChefSpec::Stubs::DataBagStub do
  it 'inherts from Stub' 


  describe '#initialize' do
    it 'sets the bag and block' 

  end

  describe '#signature' do
    context 'when a value is given' do
      subject { described_class.new('bag').and_return(false) }

      it 'includes the value' 

    end

    context 'when a block is given' do
      subject { described_class.new('bag') { 1 == 2 } }

      it 'includes a comment about the block' 

    end
  end
end

