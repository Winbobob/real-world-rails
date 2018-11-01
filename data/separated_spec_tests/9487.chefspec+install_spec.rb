require 'chefspec'

describe 'custom_matcher::install' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'installs a custom_matcher with the default action' 


  it 'installs a custom_matcher with an explicit action' 


  it 'installs a custom_matcher with attributes' 


  it 'installs a custom_matcher when specifying the identity attribute' 


  it 'defines a runner method' 

end

