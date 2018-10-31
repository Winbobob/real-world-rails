require 'spec_helper'

describe ChefSpec::Stubs::DataBagItemStub do
  it 'inherts from Stub' 


  describe '#initialize' do
    it 'sets the bag, id, and block' 

  end

  describe '#signature' do
    context 'when a value is given' do
      subject { described_class.new('bag', 'id').and_return(false) }

      it 'includes the value' 

    end

    context 'when a block is given' do
      subject { described_class.new('bag', 'id') { 1 == 2 } }

      it 'includes a comment about the block' 

    end
  end
end

