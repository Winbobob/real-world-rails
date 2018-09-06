require 'spec_helper'

describe ChefSpec::Stubs::SearchStub do
  it 'inherts from Stub' 


  describe '#initialize' do
    it 'sets the type, query, and block' 

  end

  describe '#signature' do
    context 'when a value is given' do
      subject { described_class.new('type', 'query').and_return(false) }

      it 'includes the value' 

    end

    context 'when a block is given' do
      subject { described_class.new('type', 'query') { 1 == 2 } }

      it 'includes a comment about the block' 

    end
  end
end

