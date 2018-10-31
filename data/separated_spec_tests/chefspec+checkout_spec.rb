require 'chefspec'

describe 'git::checkout' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }

  it 'checkouts a git with an explicit action' 


  it 'checkouts a git with attributes' 


  it 'checkouts a git when specifying the identity attribute' 

end

