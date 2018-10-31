require_relative 'struct_shared'

module Concurrent
  RSpec.describe SettableStruct do

    it_should_behave_like :struct
    it_should_behave_like :mergeable_struct

    let(:anonymous) { described_class.new(:name, :address, :zip) }
    let!(:customer) { described_class.new('Customer', :name, :address, :zip) }
    let(:joe)       { customer.new('Joe Smith', '123 Maple, Anytown NC', 12345) }
    let(:empty)     { customer.new }

    subject { anonymous.new }

    context 'definition' do

      it 'defines a setter for each member' 

    end

    context '#[member]=' do

      it 'sets the value when given a valid symbol member' 


      it 'sets the value when given a valid string member' 


      it 'raises an exception when given a non-existent symbol member' 


      it 'raises an exception when given a non-existent string member' 


      it 'raises an exception when given a symbol member that has already been set' 


      it 'raises an exception when given a string member that has already been set' 

    end

    context '#[index]=' do

      it 'sets the value when given a valid index' 


      it 'raises an exception when given an out-of-bound index' 


      it 'raises an exception when given an index that has already been set' 

    end

    context 'synchronization' do

      it 'protects #values' 


      it 'protects #values_at' 


      it 'protects #[index]' 


      it 'protects #[member]' 


      it 'protects getter methods' 


      it 'protects #[index]=' 


      it 'protects #[member]=' 


      it 'protects getter methods' 


      it 'protects #to_s' 


      it 'protects #inspect' 


      it 'protects #to_h' 


      it 'protects #merge' 


      it 'protects #==' 


      it 'protects #each' 


      it 'protects #each_pair' 


      it 'protects #select' 

    end
  end
end

