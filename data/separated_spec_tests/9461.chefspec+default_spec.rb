require 'chefspec'

describe 'stub_data_bag_item::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) } 

  context 'when the data_bag_item is not stubbed' do
    it 'raises an exception' 

  end

  context 'as a Symbol' do
    it 'does not raise an exception' 

  end

  context 'as a String' do
    it 'does not raise an exception' 

  end
end

