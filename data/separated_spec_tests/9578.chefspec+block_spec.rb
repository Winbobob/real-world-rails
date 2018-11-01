require 'chefspec'

describe 'stub_search::block' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  context 'when the search is not stubbed' do
    it 'raises an exception' 

  end

  context 'as a String' do
    it 'does not raise an exception' 

  end

  context 'as a Regexp' do
    it 'does not raise an exception' 

  end
end

