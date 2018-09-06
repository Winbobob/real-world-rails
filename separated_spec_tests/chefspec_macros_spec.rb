require 'spec_helper'

describe ChefSpec::Macros do
  describe '#stub_command' do
    let(:command_stub) { double('command') }

    it 'adds the command to the command registry' 

  end

  describe '#stub_search' do
    let(:search_stub) { double('search') }

    it 'adds the query to the search registry' 

  end

  describe '#stub_data_bag' do
    let(:data_bag_stub) { double('data_bag') }

    it 'adds the query to the data_bag registry' 

  end

  describe '#stub_data_bag_item' do
    let(:data_bag_item_stub) { double('data_bag_item') }

    it 'adds the query to the data_bag_item registry' 

  end

  describe '#stub_node' do
    it 'returns a Chef::Node' 


    it 'defaults the node name to `node.example`' 


    it 'sets the node name when given' 


    it 'sets the automatic attributes' 


    it 'sets the automatic attributes with ohai overrides' 


    it 'sets the automatic attributes for a specific platform and version' 


    it 'sets the automatic attributes from a JSON data path' 


    it 'yields a block' 

  end
end

describe 'nginx::source' do
  describe '#described_cookbook' do
    describe 'nginx::source' do
      it 'returns the name of the cookbook' 


      context 'in a nested context' do
        it 'still returns the name of the cookbook' 

      end
    end
  end

  describe '#described_recipe' do
    describe 'nginx::source' do
      it 'returns the cookbook::recipe' 


      context 'in a nested context' do
        it 'still retrns the cookbook::recipe' 

      end
    end
  end
end

