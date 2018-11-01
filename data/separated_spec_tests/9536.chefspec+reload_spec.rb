require 'chefspec'

describe 'ohai::reload' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'reloads a ohai with the default action' 


  it 'reloads a ohai with an explicit action' 


  it 'reloads a ohai with attributes' 


  it 'reloads a ohai when specifying the identity attribute' 

end

