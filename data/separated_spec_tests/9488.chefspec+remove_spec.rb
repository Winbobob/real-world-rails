require 'chefspec'

describe 'custom_matcher::remove' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'removes a custom_matcher with an explicit action' 


  it 'removes a custom_matcher with attributes' 


  it 'removes a custom_matcher when specifying the identity attribute' 


  it 'defines a runner method' 

end

