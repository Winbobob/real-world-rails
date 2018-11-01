require 'chefspec'

describe 'execute::run' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'runs a execute with the default action' 


  it 'runs a execute with an explicit action' 


  it 'runs a execute with attributes' 


  it 'runs a execute when specifying the identity attribute' 

end

